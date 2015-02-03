CXX=g++
CXX_OPTS= -Wall -g -O2 -DDEBUG1
CXXFLAGS=$(CXX_OPTS)

CC=cc
CFLAGS=
CC_OPTS=-lstdc++ -lm
LDFLAGS=$(CC_OPTS)
#LDFLAGS=-lpthread -pthread -lstdc++ -lsupc++ 
#LD_OPTS=-lpthread -lrt -lstdc++

INSTALL=install

OBJ_PS3CONTROLLER=ps3controller.o routines.o ps3config.o ps3dev.o

%.o: %.c                                                                         
	$(CXX) -c $(CXXFLAGS) $(CXX_OPTS) $< -o $@ 

all: ps3controller 

ps3controller: $(OBJ_PS3CONTROLLER)
	$(CC) $(CFLAGS) $(OBJ_PS3CONTROLLER) -o ps3controller $(LDFLAGS) $(CC_OPTS) 

install:
	$(INSTALL) -m 0755 -d $(DESTDIR)/var/www/addons
	$(INSTALL) -m 755 utils/www/* $(DESTDIR)/var/www/addons/
	$(INSTALL) -m 0755 -d $(DESTDIR)/usr/local/bin
	$(INSTALL) -m 755 ps3controller $(DESTDIR)/usr/local/bin/
	$(INSTALL) -m 755 utils/ps3controller.sh $(DESTDIR)/usr/local/bin/
	$(INSTALL) -m 755 utils/ps3picsnap.sh $(DESTDIR)/usr/local/bin/
	$(INSTALL) -m 755 utils/ps3vidsnap.sh $(DESTDIR)/usr/local/bin/
	$(INSTALL) -m 755 utils/S99ps3controller $(DESTDIR)/etc/init.d/
	$(INSTALL) -m 755 utils/ps3.config $(DESTDIR)/etc/avrminicopter/


clean:
	rm -rf ps3controller 
	rm -rf *.o *~ *.mod

