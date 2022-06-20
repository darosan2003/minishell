# Variable para el compilador
CC = gcc
# Variable para las flags de compilacion
CFLAGS = -Wall -c -g3
# Variable para las flags de enlazado
CLINKERS = -o
# Variable para el directorio de los objetos
OBJ_DIR = /obj/
# Variable para guardar los targets
TARGET = minishell
# Variable para guardar los objetos
OBJ = minishell.o

.PHONY: all
all: dir $(TARGET)

$(TARGET): $(OBJ)
	@echo "[+] Generating the executable..."
	@cd .$(OBJ_DIR); $(CC) $^ $(CLINKERS) $@; mv $@ ../$@
	@echo "[+] Done!"

%.o: %.c
	@echo "[+] Generating the .o file..."
	$(CC) $(CFLAGS) $<
	@mv *.o .$(OBJ_DIR)

.PHONY: clean
clean:
	@echo "[+] Removing .$(OBJ_DIR) directory and the executables..."
	@if [ -d .$(OBJ_DIR) ] && [ -f $(TARGET) ]; then rm -rf .$(OBJ_DIR) $(TARGET); echo "[+] Done!"; else echo "[-] .$(OBJ_DIR) or $(TARGET) don't exist"; fi

.PHONY: dir
dir:
	@echo "Creating .$(OBJ_DIR) directory..."
	@if [ ! -d .$(OBJ_DIR) ]; then mkdir .$(OBJ_DIR); echo "[+] Done!"; else echo "[-] .$(OBJ_DIR) already exists"; fi
