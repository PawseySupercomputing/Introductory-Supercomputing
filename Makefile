
all: darts-mpi.x darts-omp.x

%.x: %.f
	ftn -o $@ $<

