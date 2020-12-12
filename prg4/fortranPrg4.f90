! Xiana Lara
! September 28, 2020
! Programming 4: Comparing interpreted and compiled codes

! Original Sources
! https://labmathdu.wordpress.com/gaussian-elimination-without-pivoting/

! Current Purpose
! Comparing interpreted and compiled languages by measuring
! the time it takes to run the programs with different data sizes

! Input: Square matrices size
! Output: The amount of time in seconds each program ran for


PROGRAM gaussian_elimination
    IMPLICIT NONE
    
    INTEGER::n,i,j,l

    REAL::s,rand,start,finish
    REAL,DIMENSION(:,:), allocatable :: a
    REAL,DIMENSION(:), allocatable :: x

    WRITE(*,*)"Matrix Size: "
    READ(*,*) n

    ALLOCATE(a(n,n+1))
    ALLOCATE(x(n))
    
    DO i = 1, n
       
        DO j = 1, n + 1
          
          call random_number(rand)
          a(i, j) = rand
       
        END DO
    
    END DO   

    DO l = 1, 5
       
        CALL CPU_TIME(start)

        DO j = 1, n
           
            DO i = j + 1, n
               
                a(i, :) = a(i, :) - a(j, :) * a(i, j) / a(j, j)
            
            END DO
       
        END DO

        DO i = n, 1, -1
           
            s = a(i, n + 1)
           
            DO j = i + 1, n

                s = s - a(i, j) * x(j)
            
            END DO 

            x(i) = s / a(i, i)

        END DO
    
        CALL CPU_TIME(finish)

        WRITE (*,*) (finish-start)
   
    END DO

END PROGRAM