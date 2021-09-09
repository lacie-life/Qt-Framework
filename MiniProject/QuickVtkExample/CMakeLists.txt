cmake_minimum_required(VERSION 3.14)

project(QuickVtkExample VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

find_package(VTK REQUIRED)
include_directories(${VTK_USE_FILE})

configure_file(VtkFboInQtQuickConfig.h.in ${PROJECT_BINARY_DIR}/VtkFboInQtQuickConfig.h)

set (SOURCES main.cpp
             QVTKFramebufferObjectItem.cpp)

set (HEADERS QVTKFramebufferObjectItem.h)

source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})

qt5_add_resources(QT_RESOURCES qml.qrc)

add_executable(${PROJECT_NAME} 
  ${HEADERS}
  ${SOURCES}
  ${QT_RESOURCES}
)
target_link_libraries(${PROJECT_NAME} ${VTK_LIBRARIES} Qt5::Quick Qt5::Core)


