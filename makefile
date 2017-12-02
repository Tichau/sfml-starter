RMDIR=rm -rf
LIBDIR=Development/Librairies
BUILDDIR=Build
PROJECTDIR=Development/Project
APPNAME=Game

DEPDIR=$(PROJECTDIR)/.dependencies
OBJDIR=$(PROJECTDIR)/.objects

$(shell mkdir -p $(DEPDIR) >/dev/null)
$(shell mkdir -p $(OBJDIR) >/dev/null)
$(shell mkdir -p $(BUILDDIR) >/dev/null)

CXXFLAGS = -std=c++11 -I$(LIBDIR)/$(PLATFORM)/SFML/include
LDFLAGS = -std=c++11 -L$(LIBDIR)/$(PLATFORM)/SFML/lib
LDDEBUGLIBS = -lsfml-graphics-d -lsfml-window-d -lsfml-system-d
LDRELEASELIBS = -lsfml-graphics -lsfml-window -lsfml-system

SRCS = main.cpp
_OBJS=$(subst .cpp,.o,$(SRCS))
OBJS=$(patsubst %,$(OBJDIR)/%,$(_OBJS))

# Handle dependencies automatically
#http://make.mad-scientist.net/papers/advanced-auto-dependency-generation/#combine
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.Td

COMPILECXX = $(CXX) $(DEPFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
POSTCOMPILECXX = @mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d && touch $@

$(OBJDIR)/%.o : $(PROJECTDIR)/%.cpp
$(OBJDIR)/%.o : $(PROJECTDIR)/%.cpp $(DEPDIR)/%.d
	$(COMPILECXX) $(OUTPUT_OPTION) $<
	$(POSTCOMPILECXX)

$(DEPDIR)/%.d: ;
.PRECIOUS: $(DEPDIR)/%.d

include $(wildcard $(patsubst %,$(DEPDIR)/%.d,$(basename $(SRCS))))

# Tasks

all: build-windows build-linux

build-windows-debug: CXX=g++
build-windows-debug: PLATFORM=Windows
build-windows-debug: TARGET=Debug
build-windows-debug: OUTPUTDIR=$(BUILDDIR)/$(PLATFORM)/$(TARGET)
build-windows-debug: OUTPUTPATH=$(OUTPUTDIR)/$(APPNAME).exe
build-windows-debug: CXXFLAGS += -DDEBUG -g
build-windows-debug: $(OBJS)
	$(shell mkdir -p $(OUTPUTDIR) >/dev/null)
	$(CXX) $(LDFLAGS) -o $(OUTPUTPATH) $(OBJS) $(LDDEBUGLIBS)
	$(shell cp $(LIBDIR)/$(PLATFORM)/SFML/bin/*-d-2.dll $(OUTPUTDIR))

build-windows-release: CXX=g++
build-windows-release: PLATFORM=Windows
build-windows-release: TARGET=Release
build-windows-release: OUTPUTDIR=$(BUILDDIR)/$(PLATFORM)/$(TARGET)
build-windows-release: OUTPUTPATH=$(OUTPUTDIR)/$(APPNAME).exe
build-windows-release: CXXFLAGS:=$(CXXFLAGS) -O3
build-windows-release: $(OBJS)
	$(shell mkdir -p $(OUTPUTDIR) >/dev/null)
	$(CXX) $(LDFLAGS) -o $(OUTPUTPATH) -O3 $(OBJS) $(LDRELEASELIBS)
	$(shell cp $(LIBDIR)/$(PLATFORM)/SFML/bin/*-2.dll $(OUTPUTDIR))

build-linux-debug: CXX=g++-4.9
build-linux-debug: PLATFORM=Linux
build-linux-debug: TARGET=Debug
build-linux-debug: OUTPUTDIR=$(BUILDDIR)/$(PLATFORM)/$(TARGET)
build-linux-debug: OUTPUTPATH=$(OUTPUTDIR)/$(APPNAME).out
build-linux-debug: CXXFLAGS += -DDEBUG -g
build-linux-debug: $(OBJS)
	$(shell mkdir -p $(OUTPUTDIR) >/dev/null)
	$(CXX) $(LDFLAGS) -o $(OUTPUTPATH) $(OBJS) $(LDDEBUGLIBS)

build-linux-release: CXX=g++-4.9
build-linux-release: PLATFORM=Linux
build-linux-release: TARGET=Release
build-linux-release: OUTPUTDIR=$(BUILDDIR)/$(PLATFORM)/$(TARGET)
build-linux-release: OUTPUTPATH=$(OUTPUTDIR)/$(APPNAME).out
build-linux-release: CXXFLAGS:=$(CXXFLAGS) -O3
build-linux-release: $(OBJS)
	$(shell mkdir -p $(OUTPUTDIR) >/dev/null)
	$(CXX) $(LDFLAGS) -o $(OUTPUTPATH) -O3 $(OBJS) $(LDRELEASELIBS)

clean:
	$(RMDIR) $(OBJDIR)
	$(RMDIR) $(DEPDIR)
