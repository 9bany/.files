mod hs;
mod brew;
mod os;
use clap::Parser;

#[derive(Parser)]
#[command(name = "bdot")]
#[command(author = "Bany Y. <ybuoceban4569@gmail.com>")]
#[command(version = "0.0.1")]
#[command(about = "Dotfiles command line", long_about = None)]

enum Cli {
    HammerSpoon(hs::Command),
    Brew(brew::Command)
}

fn main() {
    let cli = Cli::parse();
    match cli {
        Cli::HammerSpoon(c) => {
            hs::handle(c.command);
        }
        Cli::Brew(c)=> {
            brew::handle(c.command);
        }
    }
}