use clap::{Parser, Subcommand};
use crate::os::{OS, get_os};

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
#[command(propagate_version = true)]
pub(crate) struct Command {
  #[command(subcommand)]
  pub command: SCommands,
}

#[derive(Subcommand)]
pub enum SCommands {
    Install
}

pub fn handle(e: SCommands) {
    match get_os() {
        OS::Mac => {
            match e {
                SCommands::Install => {
                    println!("Run install brew");
                    exec();
                }
            }
        }
        _ => {
            println!("hammerspoon only run on macos")
        }
        
    }    
}

fn exec() {
    use std::process::Command;
    // /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    let _ = Command::new("/bin/bash")
    .arg("-c")
    .arg("$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
    .output()
    .expect("failed to execute process");

}

