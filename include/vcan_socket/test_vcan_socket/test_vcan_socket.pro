TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

CONFIG -= console

VLIBS_DIR = $$PWD/../..
include( $$VLIBS_DIR/qmake/gtest.pri )
include( $$VLIBS_DIR/qmake/vcan_socket.pri )
include( $$VLIBS_DIR/qmake/vtimer.pri )

SOURCES += main.cpp

OTHER_FILES += CMakeLists.txt
OTHER_FILES += ../README
