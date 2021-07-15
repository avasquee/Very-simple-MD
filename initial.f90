!This subroutine assigns the initial potition to all the system particules
subroutine initial_pos
  use parameters
  use variables
  implicit none
  
  integer(i4b) i, j ,k, part, ii
  real(dp) a, a2, posx1, posx2, posy1, posy2, posz1, posz2
  
  a = lat/sig
  a2 = a/2.0d0
  part = 0

  x_coor: do i = 1, cells
     
     posx1 = (i-1)*a
     posx2 = (i-1)*a + a2
     
     y_coor: do j = 1, cells
        
        posy1 = (j-1)*a
        posy2 = (j-1)*a + a2
        
        z_coor:do k = 1, cells
           
           posz1 = (k-1)*a
           posz2 = (k-1)*a + a2
           
           part = part + 4
           ii = 3*part

           !particule 1           
           xi(ii - 11) = posx1
           xi(ii - 10) = posy1
           xi(ii - 9) = posz1

           !particule 2
           xi(ii - 8) = posx2
           xi(ii - 7) = posy2
           xi(ii - 6) = posz1

           !particule 3
           xi(ii - 5) = posx2
           xi(ii - 4) = posy1
           xi(ii - 3) = posz2

           !particule 4
           xi(ii - 2) = posx1
           xi(ii - 1) = posy2
           xi(ii     ) = posz2
           
        end do z_coor

     end do y_coor
     
  end do x_coor

  if (nn /= part) then
     print*, 'Error in the number of particules, nn = ', nn, ' part = ', part
     stop
  end if

end subroutine initial_pos

!This subroutine uses a Gaussian distribution according to the reduced temperature
subroutine initial_vel
  use parameters
  use variables
  implicit none
  integer(i4b) i
  real(dp) suma, gauss, temperature, v0
  real(dp), dimension(3)::sumv

  v0 = sqrt(3*temp)

  do i = 1, nn

     call ran_vel
     vi(3*i - 2:3*i) = v0*ks
     
  end do

  do i = 1, nn
     temperature = temperature + dot_product(vi(3*i - 2:3*i),vi(3*i - 2:3*i))
  end do
  temperature = temperature/(3*nn)

  print*, 'Temperature = ', temperature*epsi
  
end subroutine initial_vel





