QT += quick gui

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x051200    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        src/hw/heateriface.cpp \
        src/hw/mock/mockheater.cpp \
        src/hw/oven.cpp \
        src/main.cpp \
        src/nav/navigator.cpp \
        src/uiproxy.cpp

INCLUDEPATH += src

RESOURCES += res/qtquickcontrols2conf.qrc \
    res/imgs.qrc \
    res/test.qrc \
    res/settings.qrc \
    lib/TickSlider.qrc
RESOURCES += res/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = lib

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/hw/heateriface.h \
    src/hw/mock/mockheater.h \
    src/hw/oven.h \
    src/nav/navigator.h \
    src/uiproxy.h \
    src/vendor.h

DISTFILES += \
    README
