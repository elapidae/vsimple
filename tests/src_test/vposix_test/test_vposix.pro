TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

#CONFIG += console
#CONFIG -= console

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/gtest.pri  )
include( $$VSIMPLE_DIR/qmake/vposix.pri )

INCLUDEPATH += $$PWD

SOURCES += main.cpp
