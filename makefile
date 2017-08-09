CC := gcc

INCDIR := ./inc
SRCDIR := ./src
OBJDIR := ./obj
LIBDIR := ./bin
BINDIR := ./bin
TARGET := test

CFLAGS += #-L. 
CFLAGS += #-march=armv7-a
CFLAGS += #-fno-tree-vectorize
CFLAGS += #-mthumb-interwork
CFLAGS += #-mfloat-abi=softfp
CFLAGS += #-mfpu=neon
CFLAGS += #-mtune=cortex-a8
CFLAGS += #-mno-thumb-interwork
CFLAGS += #-mno-thumb
CFLAGS += #-Wundef
CFLAGS += #-Wstrict-prototypes
CFLAGS += #-Wno-trigraphs
CFLAGS += #-g -O0
CFLAGS += #-fno-inline
CFLAGS += #-fno-short-enums
CFLAGS += #-fpic
CFLAGS += #-Dstrlcat=strncat
CFLAGS += #-fexpensive-optimizations
CFLAGS += #-frename-registers
CFLAGS += #-fomit-frame-pointer

LDFLAGS := $(CFLAGS)

LIBS := \
	#-lmcm \
	#-lrt \
	#-lc \
	#-lpthread

LIBDIRS :=  \
	-L./lib/lib

INCPATHS := \
	-I. \
	-I$(INCDIR) \
	-I./lib/inc

SOURCES := \
	main.c \
	base_calculate.c

OBJECTS := $(addprefix $(OBJDIR)/, $(SOURCES:.c=.o))

$(LIBDIR)/$(TARGET): $(OBJECTS)
	@-mkdir -p $(LIBDIR) 2> /dev/null
	$(CC) -o $@ $(LDFLAGS) $(OBJECTS) $(LIBDIRS) $(LIBS)

$(OBJECTS): $(OBJDIR)/%.o: $(SRCDIR)/%.c makefile
	@-mkdir -p $(OBJDIR) 2> /dev/null
	$(CC) -c $(CFLAGS) $(INCPATHS) -o $@  $<

all: $(OBJECTS) $(LIBDIR)/$(TARGET)

clean:
	rm -f $(OBJECTS) $(LIBDIR)/$(TARGET)
