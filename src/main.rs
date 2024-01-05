use clap::Parser;

#[derive(Parser)]
#[command(name = "bdot")]
#[command(author = "Bany Y. <ybuoceban4569@gmail.com>")]
#[command(version = "0.0.1")]
#[command(about = "Dotfiles command line", long_about = None)]
struct Cli {
    #[arg(long)]
    hey: String,
}

fn main() {
    let cli = Cli::parse();
    println!("Hey {}!!!", cli.hey);
}