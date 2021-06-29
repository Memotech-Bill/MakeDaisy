CC = gcc
LIBS = -lmpg123
BIN = /usr/local/bin

id3dump : id3dump.c
	$(CC) -o id3dump id3dump.c $(LIBS)

.PHONY: install
install : id3dump makedaisy
	install -t $(BIN) -m 755 id3dump makedaisy

