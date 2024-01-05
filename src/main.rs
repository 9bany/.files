mod hs;
use clap::Parser;

#[derive(Parser)]
#[command(name = "bdot")]
#[command(author = "Bany Y. <ybuoceban4569@gmail.com>")]
#[command(version = "0.0.1")]
#[command(about = "Dotfiles command line", long_about = None)]

enum Cli {
    HammerSpoon(hs::Command),
}

fn main() {
    let cli = Cli::parse();
    match cli {
        Cli::HammerSpoon(c) => {
            hs::handle(c.command);
        }
    }
}