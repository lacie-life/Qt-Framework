cmake_minimum_required(VERSION 2.8)

PROJECT(plcviewer)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


find_package(PCL 1.7 REQUIRED)
include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

FIND_PACKAGE(VTK)
INCLUDE(${VTK_USE_FILE})

find_package(Qt5Widgets REQUIRED)
find_package(Qt5Core REQUIRED)

find_package(Boost COMPONENTS thread REQUIRED)


set(QT5_LIBRARIES Qt5::Widgets Qt5::Core)

set(TARGET ${CMAKE_PROJECT_NAME})

set(HEADERS
    pclwindow.h
    )

set(SOURCES
    main.cpp
    pclwindow.cpp
)

set(UI_SOURCES
    pclwindow.ui
)

qt5_wrap_ui(UI_GENERATED_HEADERS ${UI_SOURCES})

ADD_EXECUTABLE(${TARGET} ${SOURCES} ${HEADERS} ${UI_GENERATED_HEADERS})

TARGET_LINK_LIBRARIES(plcviewer ${PCL_LIBRARIES} ${QT5_LIBRARIES} ${VTK_LIBRARIES} Boost::thread)
