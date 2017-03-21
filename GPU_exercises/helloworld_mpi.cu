#include <stdio.h>
#include <string.h>
#include <mpi.h>
#include <cuda.h>
int devCount;
int myid;
int ihavecuda;
int deviceselector=0;


int main(int argc, char* argv[]) {
	int myrank;
	char hostname[MPI_MAX_PROCESSOR_NAME];
	int resultlen;
	/* Initialize the MPI library */
	MPI_Init(&argc, &argv);
	/* Determine unique id of the calling process of all processes participating
	   in this MPI program. This id is usually called MPI rank. */
	MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
	/* Get hostname where the MPI-tasks are running*/
	MPI_Get_processor_name(hostname, &resultlen);
	/*CUDA segment of work invoked on each MPI-task as host*/
	cudaGetDeviceCount(&devCount);
	if (devCount == 0) {
		printf("[Hostname=%s | rank=%d]: \nDevcount %4d NONE\n",hostname,myrank,devCount);
		ihavecuda=0;
	}
	else{
		ihavecuda=1;
		if (devCount >= 1){
			printf("[Hostname=%s | rank=%d]: \nDevcount %4d NONE\n",hostname,myrank,devCount);
			for (int i = 0; i < devCount; ++i)
			{
				cudaDeviceProp devProp;
				cudaGetDeviceProperties(&devProp, i);
				printf("[rank=%d]: devprop name %s i=(%d) \n ",myrank, devProp.name, i);
			}
		}
	}

	/* Finalize the MPI library to free resources acquired by it. */
	MPI_Finalize();
	return 0;


}


