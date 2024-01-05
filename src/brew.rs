
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
    Install,
    Configuration
}

pub fn handle(e: SCommands) {
    match get_os() {
        OS::Mac => {
            match e {
                SCommands::Install => {
                    println!("this run install")
                },
                SCommands::Configuration => {
                    println!("this run conguration")
                }
            }
        }
        OS::Ubuntu => {
            println!("hammerspoon not available on ubuntu")
        }
    }
    
}