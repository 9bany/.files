
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export TYPEWRITTEN_SYMBOL="$"
export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "

complex_time() {
  local time=$(date +%H:%M:%S)
  echo "😎 ~ $time"
}

export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=complex_time

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten


alias k="kubectl"
alias dk="docker"
alias c="codium"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eban.y/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eban.y/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eban.y/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eban.y/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

monitor() (
    # extract params
    title=$1
    command=${@:2} # get command and params from the 2nd one
    
    # create result folder if not existed
    [ ! -d $title ] && mkdir $title
    
    # measure execution time
    start=$SECONDS
    
    # run command in background
    ($command 2>&1 & echo $! > pid.txt) | tee "${title}/${title}_log.txt" &
    sleep 1
    # get command's PID of last job in background
    pid=$(<pid.txt)
    
    # use top to monitor the process
    # use grep to catch useful lines, using line buffered mode to send output in lines
    # use awk to extract data columns, reading input in line buffered mode
    (top -b -d 1 -p $pid & echo $! > pid.txt) \
      | grep --line-buffered $pid \
      | awk -W interactive '{printf "\nCPU= %d MEM= %d\n", $9, $10}' \
      | tee >(grep CPU > "${title}/${title}_usage.txt") &
    sleep 1
    # save top's PID to control it
    toppid=$(<pid.txt)
    
    # check if the command is running
    while [ -e /proc/$pid ]
    do
        sleep 1
    done
    
    # kill top
    sleep 1
    kill -9 $toppid
    
    # clean up
    rm pid.txt
    
    # output average data, exclude sleeping time
    echo -e "\nTotal time: $(($SECONDS-$start-3)) seconds"
    cat "${title}/${title}_usage.txt" \
      | awk '\
          { sum1 += $2; sum2 += $4; n++} \
          END { printf "Average: CPU= %d MEM= %d\n", sum1/n, sum2/n} \
        '
    
    # draw to terminal
    gnuplot -e " \
      set term dumb; \
      set yrange [0:100]; \
      plot \
        '${title}/${title}_usage.txt' using 2 title 'CPU' with lines, \
        '' using 4 title 'MEM' with lines \
    "
    
    # export to image
    gnuplot -e " \
      set term png size 640, 480; \
      set output '${title}/${title}_usage.png'; \
      set yrange [0:100]; \
      set grid xtics lc rgb '#bbbbbb' lw 1 lt 1; \
      set grid ytics lc rgb '#bbbbbb' lw 1 lt 1; \
      plot \
        '${title}/${title}_usage.txt' using 2 title 'CPU' with lines lw 2, \
        '' using 4 title 'MEM' with lines lw 2 \
    "
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# cargo
source $HOME/.cargo/env
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
