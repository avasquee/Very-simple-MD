#  Makefile to f90 codes

# Compilation type
DEB_FLAG = -g #-check bounds -error_limit 2 -V -check output_conversion -check overflow -traceback       #Debug 
REL_FLAG = -O3           #Release

#TYPE = RELEASE
TYPE = DEBUG

ifeq "$(TYPE)" "DEBUG"
 DFLAG = $(DEB_FLAG)
else
 ifeq "$(VERSION)" "RELEASE"
  DFLAG = $(REL_FLAG)
 endif
endif

# Intel Fortran macros
#FC      = ifort
FC   = gfortran
FFLAG  = -c

# Files
OBJ = main.f90 inout.f90 initial.f90 energy.f90 functions.f90
VAR = variable.f90

# Compilacion y linking
HW23: $(OBJ) $(VAR) 
	$(FC) -o $@ $(OBJ) $(VAR) $(DFLAG)

modo: $(VAR)
	$(FC) $(FFLAG) $(VAR)

clean:
	rm -f simpleMD *.o *.f90~ Makefile~ *.mod 
