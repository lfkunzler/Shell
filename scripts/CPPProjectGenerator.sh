#!/bin/bash

if [ $# -ne 2 ] 
then 
  echo "Uso: $0 folder project_name"
  exit
fi

FOLDER=$1
PROJECT=$2

mkdir $FOLDER/$2
mkdir $FOLDER/$2/build
mkdir $FOLDER/$2/build/objects
mkdir $FOLDER/$2/build/apps
mkdir $FOLDER/$2/inc
mkdir $FOLDER/$2/inc/modulo
mkdir $FOLDER/$2/src
mkdir $FOLDER/$2/src/modulo

touch $FOLDER/$2/Makefile
touch $FOLDER/$2/src/main.cpp
touch $FOLDER/$2/inc/main.hpp
touch $FOLDER/$2/src/modulo/rename.cpp
touch $FOLDER/$2/inc/modulo/rename.hpp

echo "#include <iostream>"		>> $FOLDER/$2/src/main.cpp
echo "using namespace std;"		>> $FOLDER/$2/src/main.cpp
echo ""							>> $FOLDER/$2/src/main.cpp
echo "int main(void)"			>> $FOLDER/$2/src/main.cpp
echo "{"						>> $FOLDER/$2/src/main.cpp
echo "	cout << \"Hello\n\";"	>> $FOLDER/$2/src/main.cpp
echo "	return 0;"				>> $FOLDER/$2/src/main.cpp
echo "}"						>> $FOLDER/$2/src/main.cpp

echo "#ifndef RENAME_HPP"		>> $FOLDER/$2/inc/modulo/rename.hpp
echo "#define RENAME_HPP"		>> $FOLDER/$2/inc/modulo/rename.hpp
echo ""							>> $FOLDER/$2/inc/modulo/rename.hpp
echo "class Rename"				>> $FOLDER/$2/inc/modulo/rename.hpp
echo "{"						>> $FOLDER/$2/inc/modulo/rename.hpp
echo -e "\tpublic:"				>> $FOLDER/$2/inc/modulo/rename.hpp
echo ""							>> $FOLDER/$2/inc/modulo/rename.hpp
echo -e "\tprivate:"			>> $FOLDER/$2/inc/modulo/rename.hpp
echo ""							>> $FOLDER/$2/inc/modulo/rename.hpp
echo -e "\tprotected:"			>> $FOLDER/$2/inc/modulo/rename.hpp
echo ""							>> $FOLDER/$2/inc/modulo/rename.hpp
echo "};"						>> $FOLDER/$2/inc/modulo/rename.hpp
echo "#endif // RENAME_HPP"		>> $FOLDER/$2/inc/modulo/rename.hpp

echo 'CXX      := -g++' >> $FOLDER/$2/Makefile
echo 'CXXFLAGS := -pedantic-errors -Wall -Wextra -Werror' >> $FOLDER/$2/Makefile
echo 'LDFLAGS  := -L/usr/lib -lstdc++ -lm' >> $FOLDER/$2/Makefile
echo 'BUILD    := ./build' >> $FOLDER/$2/Makefile
echo 'OBJ_DIR  := $(BUILD)/objects' >> $FOLDER/$2/Makefile
echo 'APP_DIR  := $(BUILD)/apps' >> $FOLDER/$2/Makefile
echo "TARGET   := $PROJECT" >> $FOLDER/$2/Makefile
echo 'INCLUDE  := -Iinc/' >> $FOLDER/$2/Makefile
echo 'SRC      := $(wildcard src/*.cpp) $(wildcard src/modulo/*.cpp' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'OBJECTS  := $(SRC:%.cpp=$(OBJ_DIR)/%.o)' >> $FOLDER/$2/Makefile
echo 'DEPENDENCIES := $(OBJECTS:.o=.d)' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'all: build $(APP_DIR)/$(TARGET)' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo '$(OBJ_DIR)/%.o: %.cpp' >> $FOLDER/$2/Makefile
echo '	@mkdir -p $(@D)' >> $FOLDER/$2/Makefile
echo '	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -MMD -o $@' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo '$(APP_DIR)/$(TARGET): $(OBJECTS)' >> $FOLDER/$2/Makefile
echo '	@mkdir -p $(@D)' >> $FOLDER/$2/Makefile
echo '	$(CXX) $(CXXFLAGS) -o $(APP_DIR)/$(TARGET) $^ $(LDFLAGS)' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo '-inc $(DEPENDENCIES)' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo '.PHONY: all build clean debug release info' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'build:' >> $FOLDER/$2/Makefile
echo '	@mkdir -p $(APP_DIR)' >> $FOLDER/$2/Makefile
echo '	@mkdir -p $(OBJ_DIR)' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'debug: CXXFLAGS += -DDEBUG -g' >> $FOLDER/$2/Makefile
echo 'debug: all' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'release: CXXFLAGS += -O2' >> $FOLDER/$2/Makefile
echo 'release: all' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'clean:' >> $FOLDER/$2/Makefile
echo '	-@rm -rvf $(OBJ_DIR)/*' >> $FOLDER/$2/Makefile
echo '	-@rm -rvf $(APP_DIR)/*' >> $FOLDER/$2/Makefile
echo '' >> $FOLDER/$2/Makefile
echo 'info:' >> $FOLDER/$2/Makefile
echo '	@echo "[*] Application dir: ${APP_DIR}     "' >> $FOLDER/$2/Makefile
echo '	@echo "[*] Object dir:      ${OBJ_DIR}     "' >> $FOLDER/$2/Makefile
echo '	@echo "[*] Sources:         ${SRC}         "' >> $FOLDER/$2/Makefile
echo '	@echo "[*] Objects:         ${OBJECTS}     "' >> $FOLDER/$2/Makefile
echo '	@echo "[*] Dependencies:    ${DEPENDENCIES}"' >> $FOLDER/$2/Makefile
