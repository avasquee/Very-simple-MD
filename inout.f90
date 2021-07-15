!This subroutine read the input file and allocate verctos
subroutine inputv
  use parameters
  use variables
  implicit none

  !input file
  open(111,file='input.in',status='old')
  read(111,nml = input)
  close(111)
  
  box = cells*lat/sig
  nn = 4*cells**3
  temp = temp/epsi
  dth = 0.5d0*dt
  
  allocate(xi(3*nn), fi(3*nn), fold(3*nn), vi(3*nn), ks(3))
  
  open(444,file='energy.out',status='unknown')

end subroutine inputv

!This subroutine writes energy to a file
subroutine out
  use parameters
  use variables
  implicit none
  integer(i4b) i
  
  en_total = en_kinet + energia
  
  write(444,'(E15.6, E15.6, E15.6, E15.6)') time, energia*epsi*kb2, &
       en_kinet*epsi*kb2, en_total*epsi*kb2

end subroutine out
