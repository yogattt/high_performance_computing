
FC = gfortran
FFLAGS = -fbounds-check -fopenmp
LFLAGS = $(FFLAGS)

.PHONY: plots, clean, clobber

%.o : %.f90
	$(FC) $(FFLAGS) -c $<

Guass_Seidel.exe:  Guass_Seidel_main.o Guass_Seidel.o
	$(FC) $(LFLAGS) Guass_Seidel_main.o Guass_Seidel.o -o $@

solution.txt: Guass_Seidel.exe
	@echo 
	@echo Running code...
	./Guass_Seidel.exe

plots: solution.txt
	@echo 
	@echo Plotting results...
	python plot_solution.py

clean:
	rm -f *.o *.exe

clobber: clean
	rm -f solution.txt *.png

