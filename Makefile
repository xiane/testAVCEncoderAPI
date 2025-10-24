CROSS_CC_PREFIX ?=
CC := $(CROSS_CC_PREFIX)gcc
CXX := $(CROSS_CC_PREFIX)g++
AR := $(CROSS_CC_PREFIX)ar

TARGET=testAVCApi
SOURCES=test.cpp test_dma.c
AMLENC_LIB=$(patsubst %.c, %.o, $(patsubst %.cpp, %.o, $(SOURCES)))
LDFLAGS += -lm -lrt -Lbjunion_enc -lamvenc_264 -lh264bitstream -lion -lpthread
CFLAGS +=-O2 -g
INC = -I./ -I./bjunion_enc/include/
CFLAGS += $(INC)

$(TARGET):$(AMLENC_LIB)
	$(CXX) $(CFLAGS) $^ -o $(TARGET) $(LDFLAGS)

%.o:%.cpp
	$(CXX) -c $(CFLAGS) $< -o $@
%.o:%.c
	$(CC) -c $(CFLAGS) $< -o $@

install: $(TARGET)
	cp $^ /usr/local/bin/
clean:
	-rm -f *.o
	-rm -f $(TARGET)
	make -C bjunion_enc/ clean
