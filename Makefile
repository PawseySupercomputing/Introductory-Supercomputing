
all: darts-mpi.x darts-omp.x
%.x: %.f
	ftn -o $@ $<
clean:
	rm darts-mpi.x darts-omp.x 
