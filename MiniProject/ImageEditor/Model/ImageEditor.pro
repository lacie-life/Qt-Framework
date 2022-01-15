QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app
TARGET = ImageEditor
CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += .

#unix: !mac {
INCLUDEPATH +=/home/jun/opencv-4.2.0/include/opencv2/
LIBS += -L/home/jun/opencv-4.2.0/build/lib/ -lopencv_videoio -lopencv_imgcodecs -lopencv_core -lopencv_imgproc -lopencv_features2d -lopencv_flann -lopencv_video -lopencv_calib3d -lopencv_highgui
#}

#unix: mac {
#    INCLUDEPATH += /path/to/opencv/include/opencv4
#    LIBS += -L/path/to/opencv/lib -lopencv_world
#}
#win32 {
#    INCLUDEPATH += c:/path/to/opencv/include/opencv4
#    LIBS += -lc:/path/to/opencv/lib/opencv_world
#}

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    EditorPluginInterface.h \
    mainwindow.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
