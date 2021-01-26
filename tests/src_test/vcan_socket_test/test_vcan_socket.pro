TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

CONFIG -= console

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/gtest.pri )
include( $$VSIMPLE_DIR/qmake/vcan_socket.pri )
include( $$VSIMPLE_DIR/qmake/vtimer.pri )

SOURCES += main.cpp

OTHER_FILES += CMakeLists.txt
OTHER_FILES += ../README
