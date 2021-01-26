TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

#CONFIG -= console
CONFIG += console

QT += network

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/gtest.pri )
include( $$VSIMPLE_DIR/qmake/vnetwork.pri )

SOURCES += main.cpp
