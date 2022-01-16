TEMPLATE = app
TARGET = Literacy

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

INCLUDEPATH += .

# use your own path in the following config
unix: {
    INCLUDEPATH += /home/jun/Github/tesseract/include
    LIBS += -L/home/jun/Github/tesseract/lib -ltesseract
}

win32 {
    INCLUDEPATH += c:/path/to/tesseract/include
    LIBS += -lc:/path/to/opencv/lib/tesseract
}

# opencv config
unix: !mac {
    INCLUDEPATH += /home/jun/Github/opencv/include/opencv4
    LIBS += -L/home/jun/Github/opencv/lib -lopencv_core -lopencv_imgproc -lopencv_dnn
}

unix: mac {
    INCLUDEPATH += /path/to/opencv/include/opencv4
    LIBS += -L/path/to/opencv/lib -lopencv_world
}

win32 {
    INCLUDEPATH += c:/path/to/opencv/include/opencv4
    LIBS += -lc:/path/to/opencv/lib/opencv_world
}


DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += TESSDATA_PREFIX=\\\"/home/jun/Github/tesseract/share/tessdata/\\\"

# Input
HEADERS += \
    MainWindow.h \
    ScreenCapturer.h
SOURCES += main.cpp \
    MainWindow.cpp \
    ScreenCapturer.cpp
