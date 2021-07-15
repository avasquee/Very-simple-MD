module parameters

  integer, parameter :: i4b = selected_int_kind(9)
  integer, parameter :: dp  = selected_real_kind(8)
  integer, parameter :: LGT = kind(.true.)

  real(dp), parameter :: pi=3.141592653589793238462643383279502884197
  real(dp), parameter :: kb    =  1.38064852E-23  !joules/kelvin
    real(dp), parameter :: kb2    =  8.6173303E-5   !eV/kelvin
 
end module parameters

module variables
  use parameters

  namelist /input/ epsi, sig, cells, lat, temp, dt, time_total
  
  integer(i4b),save:: nn, cells, cell

  real(dp),save:: epsi, sig, lat, energia, box, temp, en_kinet, en_total, &
       time, time_total, dt, dth

  real(dp),save,dimension(:),allocatable:: xi, fi, vi, ks, fold

end module variables


