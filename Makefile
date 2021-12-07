# specify all source files here
SRCS = wage.c

# specify target here (name of executable)
TARG = wage

# specify comiler
CC = gcc

# this translates.c files in src list to .o's
OBJS = $(wage.c = wage.o)

# all is not really needed, but is used to generate the target
all: $ wage

# this generates the target executable
$ wage : $ wage.c
  $ gcc -o $ wage $ wage.c
  
# this si  generic rule for .o files
%.o: %.c
  $ gcc -c $< -o $@
  
# and finally, a clean line
clean:
  rm -f wage.o wage.c
