TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

CONFIG -= console
#CONFIG -= qt  # test with qt.

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/gtest.pri )
include( $$VSIMPLE_DIR/qmake/vsettings.pri )

SOURCES += main.cpp

OTHER_FILES += ../vsettings.cmake
