EXEC = thread  
OBJS = thread.o  
SVR  = thread.c  

#CC = arm-linux-gcc  
CC = gcc
#CC = arm-none-linux-gnueabi-gcc

CFLAGS = -o2 -Wall -static -lpthread
#DFLAGS += -lpthread

all:$(EXEC)  

$(EXEC):$(OBJS)  
	$(CC) $(DFLAGS) -o $@ $^  
%.o:%.c  
	$(CC) $(CFLAGS) -o $@ -c $<
	#arm-none-linux-gnueabi-gcc -o thread thread.c -lpthread -static

clean:  
	@rm -vf $(EXEC) *.o *~  
