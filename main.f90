program simpleMD
  use parameters
  use variables
  implicit none

  real(dp) tt1, tt2, tiempo

  call CPU_time(tt1)
  
  call inputv
  
  call initial_pos
  call initial_vel
  call energy

  time = 0.d0  
  do while (time <= time_total)

     call integrate_pos
     fold = fi
     call pbc
     call energy
     call integrate_vel

     call out

     time = time + dt
     
  end do
  
  call CPU_time(tt2); tiempo = tt2 - tt1
  write(*,'("CPU time (min):",e20.7)'),tiempo/60.d0
  
end program simpleMD
