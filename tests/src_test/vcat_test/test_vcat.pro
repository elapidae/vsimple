TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

QT += network # for testing QHostAddress

#CONFIG -= qt  # test with qt.
CONFIG -= console

SOURCES += main.cpp

VSIMPLE_DIR = $$PWD/../..
include( $$VSIMPLE_DIR/qmake/vcat.pri )
include( $$VSIMPLE_DIR/qmake/gtest.pri )

INCLUDEPATH += $$PWD
