
use clap::{Parser, Subcommand};
// ec2.rs
#[derive(Parser)]
#[command(author, version, about, long_about = None)]
#[command(propagate_version = true)]
pub(crate) struct Command {
  #[command(subcommand)]
  pub command: SCommands,
}

#[derive(Subcommand)]
pub enum SCommands {
  FooBar
}

pub fn handle(e: SCommands) {
    match e {
        SCommands::FooBar => {
            println!("this is foo-bar")
        }
    }
}