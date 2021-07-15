subroutine ran_vel
  use parameters
  use variables
  implicit none
  real(dp),dimension(2):: rand
  real(dp) ks0, ks1, ss
  
  ks = 0.0
  ss = 2.d0
  do while ( ss .ge. 1.0d0 )
     call random_number(rand)
     ks0 = 2.d0*rand(1) - 1.d0
     ks1 = 2.d0*rand(2) - 1.d0
     ss  = ks0*ks0 + ks1*ks1
  end do
  
  ks(1) = 2*sqrt(1 - ss)*ks0
  ks(2) = 2*sqrt(1 - ss)*ks1
  ks(3) = 1 - 2*ss
  
end subroutine ran_vel

!----------------------------------------------------
subroutine integrate_pos
  use parameters
  use variables
  implicit none

  ! new position
  xi  = xi + dt*(vi + dth*fi)
  
end subroutine integrate_pos

!----------------------------------------------------
subroutine integrate_vel
  use parameters 
  use variables
  implicit none

  ! new velocity
  vi = vi + dth*(fold + fi)
  
end subroutine integrate_vel

subroutine pbc
  use parameters
  use variables,only: xi, nn, box
  implicit none
  integer(i4b) i

  do i = 1, nn

     xi(3*i - 2) = xi(3*i - 2) - dnint( xi(3*i - 1)/box)*box
     xi(3*i - 1) = xi(3*i - 1) - dnint( xi(3*i - 1)/box)*box
     xi(3*i ) = xi(3*i ) - dnint( xi(3*i )/box)*box
     
  end do

end subroutine pbc


