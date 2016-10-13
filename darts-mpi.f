
! First, the pseudorandom number generator
        real function lcgrandom()
          integer*8, parameter :: MULTIPLIER = 1366
          integer*8, parameter :: ADDEND = 150889
          integer*8, parameter :: PMOD = 714025
          integer*8, save :: random_last = 0

          integer*8 :: random_next = 0
          random_next = mod((MULTIPLIER * random_last + ADDEND), PMOD)
          random_last = random_next
          lcgrandom = (1.0*random_next)/PMOD
          return
        end

! Now, we compute pi
        program darts
          implicit none
          include 'mpif.h'
          integer :: num_trials = 100000000, i = 0, Ncirc = 0
!          integer :: num_trials = 100, i = 0, Ncirc = 0
          real :: pi = 0.0, x = 0.0, y = 0.0, r = 1.0
          real :: r2 = 0.0
          real :: lcgrandom

          integer :: rank, np, manager = 0
          integer :: mpistatus, mpierr, j
          integer :: my_trials, temp

          call MPI_Init(mpierr)
          call MPI_Comm_size(MPI_COMM_WORLD, np, mpierr)
          call MPI_Comm_rank(MPI_COMM_WORLD, rank, mpierr)
          r2 = r*r
          my_trials = num_trials/np
          if (mod(num_trials, np) .gt. rank) then
           my_trials = my_trials+1
          end if

          do i = 1, my_trials
            x = lcgrandom()
            y = lcgrandom()
            if ((x*x + y*y) .le. r2) then
              Ncirc = Ncirc+1
            end if
          end do
!          print*, 'P', rank, 'Ncirc =', Ncirc

          if (rank .eq. manager) then
            do j = 1, np-1
              call MPI_Recv(temp, 1, MPI_INTEGER, j, j, 
     &          MPI_COMM_WORLD, mpistatus, mpierr)
!              print*, 'temp =', temp
              Ncirc = Ncirc + temp
            end do
            pi = 4.0*((1.0*Ncirc)/(1.0*num_trials))
            print*, ' For ', num_trials, ' trials, pi = ', pi
          else
!            print*, 'P', rank, 'about to send Ncirc =', Ncirc
            call MPI_Send(Ncirc, 1, MPI_INTEGER, manager, rank, 
     &        MPI_COMM_WORLD, mpierr) 
!            print*, 'P', rank, 'sent Ncirc =', Ncirc
          end if
          call MPI_Finalize(mpierr)
        end

