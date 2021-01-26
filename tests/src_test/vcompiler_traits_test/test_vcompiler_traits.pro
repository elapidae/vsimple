TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

#CONFIG -= qt  # test with qt.

SOURCES += main.cpp

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/gtest.pri )
include( $$VSIMPLE_DIR/qmake/vcompiler_traits.pri )

INCLUDEPATH += $$PWD
