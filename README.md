# minishell

![](https://img.shields.io/badge/made%20with-C-blue) ![](https://img.shields.io/badge/made%20with-Rust-orange)

### Description
This program simulates a shell with which you can run all kinds of commands.
In case there was an error when running a command the program will output to it.
To exit the shell use `exit` as usual

---

### Table of Content
* Usage
* Contribute

---

### Usage
 What follows is an explanation of how to use this program

#### Compilation (C alternative)
To compile just use Make with the following parameters:
```bash
make all
``` 
It will create a folder containing all the .o files, if you want to delete them all including the executable run:
```bash
make clean
```

#### Compilation (Rust alternative)
To compile run the compile bash script. Don't forget to give it the
right permissions
```bash
./compile
```
It will check if you have the rust compiler (rustc) on your system.
If you do it will compile the file, otherwise it will exit.

---

#### Execution
This program only takes one argument, the name for the shell
```bash
./minishell <name>
```

---

### Contribute
As always I am open to suggestions, in case there are bugs lying around or if there are ways to improve the code :)
This was my first attempt with Rust, so any help is highly appreciated
