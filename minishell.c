#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define MAX_ARGS 10

void shell(char *name) {

  char command[256];
  char *q;
  pid_t pid;
  size_t dim = 0;

  while(1) {
  
    if((pid = fork()) == -1) {
      fprintf(stderr, "[-] Unable to fork the process\n");
      return;
    }

    if(pid == 0) {

      char *args[MAX_ARGS];

      printf("%s> ", name);
      fgets(command, sizeof(command), stdin);
      q = strchr(command, '\n');
      if(q) *q = '\0';

      char *arg = strtok(command, " ");
      while(arg != NULL) {
        args[dim] = arg;
        dim++;
        arg = strtok(NULL, " ");
      }

      args[dim++] = NULL;
      
      execvp(args[0], args);
      exit(1);

    }else{

      int wstat;
      wait(&wstat);

      if(WIFEXITED(wstat)) {
        int status = WEXITSTATUS(wstat);
        if(status != 0)
          puts(strerror(status));
      }else{
        fprintf(stderr, "[-] Command terminated abnormally\n");
        return;
      }

    }

  }

}

int main(int argc, char **argv) {

  if(argc != 2) {
    fprintf(stderr, "[-] Incorrect number of args supplied\n");
    fprintf(stderr, "[?] Usage: %s <name>", argv[0]);
    return 1;
  }

  shell(argv[1]);
  return 0;

}