TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle

QT += network # for testing QHostAddress

#CONFIG -= qt  # test with qt.
CONFIG -= console

SOURCES += main.cpp

VLIBS_DIR = $$PWD/../..
include( $$VLIBS_DIR/qmake/vcat.pri )
include( $$VLIBS_DIR/qmake/gtest.pri )

INCLUDEPATH += $$PWD
