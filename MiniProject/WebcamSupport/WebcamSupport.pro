TEMPLATE = app
TARGET = WebcamSupport

# Using OpenCV or QCamera
# DEFINES += USE_QT_CAMERA=1
# QT += multimediawidgets

QT += core gui multimedia widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += .

INCLUDEPATH +=/home/jun/opencv-4.2.0/include/opencv2/
LIBS += -L/home/jun/opencv-4.2.0/build/lib/ -lopencv_videoio -lopencv_imgcodecs -lopencv_core -lopencv_imgproc -lopencv_features2d -lopencv_flann -lopencv_video -lopencv_calib3d -lopencv_highgui

SOURCES += \
        CaptureThread.cpp \
        MainWindow.cpp \
        Utilities.cpp \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    CaptureThread.h \
    MainWindow.h \
    Utilities.h
