TEMPLATE = app
TARGET = Facetious
INCLUDEPATH += .

QT += core gui multimedia
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

unix: !mac {
    INCLUDEPATH += /home/jun/opencv/include/opencv4
    LIBS += -L/home/jun/opencv/lib -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_video -lopencv_videoio -lopencv_objdetect -lopencv_face
}

#unix: mac {
#    INCLUDEPATH += /path/to/opencv/include/opencv4
#    LIBS += -L/path/to/opencv/lib -lopencv_world
#}

#win32 {
#    INCLUDEPATH += c:/path/to/opencv/include/opencv4
#    LIBS += -lc:/path/to/opencv/lib/opencv_world
#}


# Input
HEADERS += MainWindow.h CaptureThread.h Utilities.h
SOURCES += main.cpp MainWindow.cpp CaptureThread.cpp Utilities.cpp

# DEFINES += OPENCV_DATA_DIR=\\\"/usr/share/opencv/\\\"
DEFINES += OPENCV_DATA_DIR=\\\"/home/jun/programs/opencv/share/opencv4/\\\"

RESOURCES = images.qrc
