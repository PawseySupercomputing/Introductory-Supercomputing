NVCC=nvcc
OBJ= deviceQuery.o helloworld_mpi.o
LDFLAGS=-fPIC -shared
ifeq ($(PAWSEY_CLUSTER),zeus)
	CC=gcc
	CXX=g++
	FC=gfortran
	MPI_INC=-I$(MPI_ROOT)/include
	MPI_LIB=-L$(MPI_ROOT)/lib -lmpi
	CUDA_PATH=$(NVIDIA_CUDA_HOME)
else
	CC=cc
	CXX=CC
	FC=ftn
	CUDA_PATH=$(CUDATOOLKIT_HOME)
endif 

CUDA_LIB=-L$(CUDA_PATH)/lib -lcudart

all: $(OBJ)
	$(NVCC) deviceQuery.o -o deviceQuery 
	$(NVCC) helloworld_mpi.o -o hello $(MPI_LIB) 

deviceQuery.o: 
	$(NVCC) -c deviceQuery.cu 
helloworld_mpi.o:
	$(NVCC) -c helloworld_mpi.cu $(MPI_INC)
clean:
	rm *.o deviceQuery hello
