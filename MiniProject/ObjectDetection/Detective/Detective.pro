TEMPLATE = app
TARGET = Detective
INCLUDEPATH += .

QT += core gui multimedia
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

unix: !mac {
    INCLUDEPATH += /home/jun/opencv/include/opencv4
    LIBS += -L/home/jun/opencv/lib -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_video -lopencv_videoio -lopencv_objdetect -lopencv_dnn
}

unix: mac {
    INCLUDEPATH += /path/to/opencv/include/opencv4
    LIBS += -L/path/to/opencv/lib -lopencv_world
}

win32 {
    INCLUDEPATH += c:/path/to/opencv/include/opencv4
    LIBS += -lc:/path/to/opencv/lib/opencv_world
}

DEFINES += OPENCV_DATA_DIR=\\\"/home/jun/opencv/share/opencv4/\\\"
DEFINES += TIME_MEASURE=1

# Input
HEADERS += MainWindow.h CaptureThread.h Utilities.h
SOURCES += main.cpp MainWindow.cpp CaptureThread.cpp Utilities.cpp
