#-------------------------------------------------
#
# Project created by QtCreator 2014-05-10T15:06:55
#
#-------------------------------------------------

QT       += core network

QT       -= gui

TARGET = radeon-profile-daemon
CONFIG   += console
CONFIG   -= app_bundle

QMAKE_TARGET_COMPANY = ""
QMAKE_TARGET_DESCRIPTION = ""
QMAKE_TARGET_COPYRIGHT =  ""

#Application version
GIT_COMMIT = $$system(git rev-parse --short=8 HEAD)
GIT_STATUS = $$system(git status --short) # Detect uncommited, unindexed, untracked files
!isEmpty(GIT_STATUS) {
    GIT_COMMIT = $${GIT_COMMIT}-dirty
}

message("GIT_STATUS: "$${GIT_STATUS})
message("GIT_COMMIT: "$${GIT_COMMIT})

VERSION_MAJOR = 2
VERSION_MINOR = 0
VERSION_PATCH = 0
VERSION_BUILD = $${GIT_COMMIT}

#Target version
VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_PATCH}
FULL_VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_PATCH}.$${VERSION_BUILD}

DEFINES += VERSION_MAJOR=$${VERSION_MAJOR}\
       VERSION_MINOR=$${VERSION_MINOR}\
       VERSION_PATCH=$${VERSION_PATCH}\
       VERSION_BUILD=\\\"$${VERSION_BUILD}\\\"\
       FULL_VERSION=$${FULL_VERSION}\
       APP_VERSION=\\\"$${FULL_VERSION}\\\"

QMAKE_CXXFLAGS += -std=c++11

#   https://forum.qt.io/topic/10178/solved-qdebug-and-debug-release/2
#   http://doc.qt.io/qt-5/qtglobal.html#QtMsgType-enum
#   qDebug will work only when compiled for Debug
#   QtWarning, QtCritical and QtFatal will work also on Release

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT


TEMPLATE = app


SOURCES += \
    main.cpp \
    rpdthread.cpp

HEADERS += \
    info.h \
    rpdthread.h

DESTDIR= target

bin.path = /usr/bin
bin.files = target/radeon-profile-daemon

service.path = /usr/lib/systemd/system
service.files = extra/radeon-profile-daemon.service

tmpfiles.path = /usr/lib/tmpfiles.d
tmpfiles.files = extra/radeon-profile-daemon.tmpfiles

INSTALLS += \
	bin \
        service \
        tmpfiles
