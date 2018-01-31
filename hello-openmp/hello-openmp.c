#include <omp.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[]) 
{
	#pragma omp parallel 
	{

		int id = omp_get_thread_num();
		int proc = sched_getcpu();
		printf("Thread %02i running on processor %i.\n", id, proc);

		if (id == 0) 
		{
			printf("There are %i threads in total.\n", omp_get_num_threads());
		}
	}	
	return EXIT_SUCCESS;
}

