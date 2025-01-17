CC = g++
CFLAGS = -std=c++11 -c -Ofast -march=native -flto -Wall -DNDEBUG -frename-registers -funroll-loops
#CFLAGS = -ansi -c -Wall -pedantic
#TODO: delete -g after debugging is done

all: mcast start_mcast

start_mcast: start_mcast.o
	$(CC) -o start_mcast start_mcast.o

mcast:mcast.o Processor.o recv_dbg.o
	$(CC) -o mcast mcast.o Processor.o recv_dbg.o

clean:
	rm *.o
	rm mcast
	rm start_mcast

%.o: %.cpp

	$(CC) $(CFLAGS) $*.cpp


