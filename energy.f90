!Funtion to calculate potential energy, forces and kinetic energy

subroutine energy
  use parameters
  use variables, only: nn, xi, fi, vi, energia, en_kinet, box, temp
  implicit none

  integer(i4b) i, j 
  real(dp) r2, s_r2, s_r6, s_r12
  real(dp),dimension(3)::dx, xo
  
  energia = 0.d0
  fi = 0.d0

  !forces and potential energy
  do i = 1,nn - 1
     
     xo = xi(3*i - 2:3*i)
     
     do j = i + 1,nn
        
        dx = xo - xi(3*j - 2:3*j)

        ! Minimum image
        dx(1) = dx(1) - dnint(dx(1)/box)*box
        dx(2) = dx(2) - dnint(dx(2)/box)*box
        dx(3) = dx(3) - dnint(dx(3)/box)*box
        
        r2 = dot_product(dx,dx)
        
        ! Lennard-Jonnes
        s_r2  = 1.d0/r2
        s_r6  = s_r2*s_r2*s_r2
        s_r12 = s_r6*s_r6
        
        energia = energia + 4.d0*( s_r12 - s_r6 )
        fi(3*i - 2:3*i) = fi(3*i - 2:3*i) + 24.d0*( 2.d0*s_r12 - s_r6 )*dx/r2
        fi(3*j - 2:3*j) = fi(3*j - 2:3*j) - 24.d0*( 2.d0*s_r12 - s_r6 )*dx/r2
        
     end do
     
  end do

  !kinetic energy
  en_kinet = 0.d0
  
  do i = 1, nn
     
     en_kinet = en_kinet + vi(3*i - 2)**2 + vi(3*i - 1)**2 + vi(3*i)**2
     
  end do
  
  en_kinet = 0.5d0*en_kinet
  temp = 2.d0*en_kinet/(3.d0*nn)
  
end subroutine energy

