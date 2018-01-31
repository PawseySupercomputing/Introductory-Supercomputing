CC=gcc
CFLAGS=-O2 -fopenmp

hello-openmp-gcc: hello-openmp.c
	$(CC) -o $@ $< $(CFLAGS)

.PHONY: clean

clean:
	rm hello-openmp-gcc


