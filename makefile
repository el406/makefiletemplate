#Enter compiler (gcc, g++, mvsc, clang etc)
CXX ?= g++ 
#Library manager
LIB_DIR = C:\CodeStuff\CppLibraries
#here you would put any includes you wanna add

#assumes existance of Includes, builds, and src folder
INCLUDE_DIR = Includes
HEADERS = $(wildcard src/*.h)
CXXFLAGS = -Wall -g -I$(INCLUDE_DIR)
#insert library dir, and modules you want to add
#LIBS = 

#insert program name here
TARGET = program_name

SRCS = $(wildcard src/*.cpp)

#build part
OBJDIR = build
# Redirect object files to OBJDIR by replacing the pattern
# (Every cpp file in SRC is set to be built in as .o files in OBJDIR)
OBJS = $(patsubst src/%.cpp, $(OBJDIR)/%.o, $(SRCS))
all:$(TARGET)
# Default target (Beginning of the actual build, i like to think)
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LIBS)
# Rule to compile .cpp to .o in OBJDIR
$(OBJDIR)/%.o: src/%.cpp $(HEADERS)|$(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@
# Ensures OBJDIR exists
$(OBJDIR):
	mkdir $(OBJDIR)
# Clean up build files
clean:
	rm -f $(OBJDIR)/*.o $(TARGET)
.PHONY: clean
