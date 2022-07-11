use std::io;
use std::env;
use std::io::Write;
use std::process::exit;
use std::process::Command;

fn shell(shellname: &String) {
    loop {
        let mut args: Vec<String> = vec![];
        let mut command = String::new();

        print!("{}> ", shellname);

        io::stdout()
            .flush()
            .expect("Failed to flush stdout");

        io::stdin()
            .read_line(&mut command)
            .expect("Failed to read from stdin");

        let command = command.trim();

        for arg in command.split_whitespace() {
            args.push(String::from(arg));
        }

        if args.len() == 0 {
            continue;
        }

        if args[0] == "exit" {
            exit(0);
        }

        let cmd = args[0].clone();
        args.remove(0);

        let output = Command::new(cmd)
            .args(args)
            .output()
            .expect("Unable to execute the command");

        println!("{}", String::from_utf8_lossy(&output.stdout));
    }
} 

fn main() {
    let argv: Vec<String> = env::args().collect();

    if argv.len() != 2 {
        println!("Incorrect number of arguments supplied. Expected 2");
        println!("Usage: {} <name>", argv[0]);
        exit(1);
    }

    shell(&argv[1]);
}
