TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

CONFIG -= console

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/gtest.pri )
include( $$VSIMPLE_DIR/qmake/vbyte_buffer.pri )
include( $$VSIMPLE_DIR/qmake/vlog.pri )

SOURCES += main.cpp
