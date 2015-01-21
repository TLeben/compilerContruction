CC = gcc
CFLAGS = -m32
LFLAGS = -lm

RM = /bin/rm -f

all:
	$(CC) $(CFLAGS) *.c *.s -o test.exe $(LFLAGS)

clean:
	@$(RM) *.o
	@$(RM) *.exe
