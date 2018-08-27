#
# Makefile for satip client
#
#
#Based on original vtuner source code from Google Code project.
#VTUNER_TYPE = VTUNER_TYPE_ORIGINAL
#
#Based on definitions found in the "usbtunerhelper" tool.

RM      := rm -fR

VTUNER_TYPE = VTUNER_TYPE_VUPLUS

CCEXT   := -march=armv7-a -mfloat-abi=hard -mfpu=neon --sysroot=$(SYSROOT)
LDEXT   := --sysroot=$(SYSROOT)

CXX     := $(CROSS)g++ $(CCEXT)
CFLAGS += -Wall -g -D$(VTUNER_TYPE)

LD      := $(CROSS)ld $(LDEXT)
LDFLAGS := -lrt -lpthread

CXXSRCS = $(wildcard ./*.cpp)
OBJS    = $(CXXSRCS:.cpp=.o)

%.o:%.cpp
	$(CXX) -c $(CFLAGS) -o $@ $<

BIN = satip-client

$(BIN):$(OBJS)
	$(CXX) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)

all:$(BIN)

clean:
	rm -f $(BIN) *.o *~

