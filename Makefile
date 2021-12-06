wage.o : input.o calc_pay.o sort_data.o output.o main.o
  gcc -o wage.o input.o calc_pay.o sort_data.o output.o main.o
  
input.o : input.c
  gcc -c -o input.o input.c
calc_pay.o : calc_pay.c
  gcc -c -o calc_pay.o calc_pay.c
 sort_data.o : sort_data.c
  gcc -c -o sort_data.o sort_data.c
 output.o : output.c
  gcc -c -o output.o output.c
 main.o : main.c
  gcc -c -o main.o main.c
  
  clean :
   rm *.o wage.o
