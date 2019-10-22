
! SOR_main.f90

program SOR_main
    implicit none
    real(kind=8) :: tol, dumax
    integer :: n,iter,maxiter,nthreads


    n = 120
    !tol = 0.1 / (n+1)**2
    tol = 1.d-6
    ! The letter "d" for double precision numbers has the same meaning as "e" for single precision numbers. 
    maxiter = 100000
    
    write (*,"('Solving Laplace equation on',i4,' by',i4,' grid by SOR iteration')") n,n
    ! i4 - 4 characters wide
    ! print "('Solving Laplace equation on',i4,' by',i4,' grid by Jacobi iteration')", n,n
    ! print "('Note: This is a lousy numerical method but illustrates OpenMP speedup')"
    write (*, 100)
	100 format ('Note: This is a lousy numerical method but illustrates OpenMP speedup')
    print *,' '

    ! Specify number of threads to use:
    nthreads = 1
    call SOR_sub(n, tol, maxiter, iter, dumax, nthreads)

    nthreads = 2
    call SOR_sub(n, tol, maxiter, iter, dumax, nthreads)


end program SOR_main
