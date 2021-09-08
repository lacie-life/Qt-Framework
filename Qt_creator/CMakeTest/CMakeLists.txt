cmake_minimum_required(VERSION 2.8)

project(CMakeTest)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# find QT5 and required components
find_package(Qt5 COMPONENTS REQUIRED Core Gui Widgets)
find_package(Mosquitto)


# need this to include the auto generated ui_mainwindow.h
# file from the qt5_wrap_ui call below.
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(project_sources mainwindow.cpp main.cpp mqttconnection.cpp)
set(project_headers mainwindow.h mqttconnection.h)
set(project_ui mainwindow.ui)

# wrap the ui file to a c++ header
qt5_wrap_ui(ui_wrap ${project_ui})
qt5_wrap_cpp(moc_sources ${project_headers})

if(MOSQUITTO_FOUND)
  include_directories(${MOSQUITTO_INCLUDE_DIRS})
#  target_link_libraries (${PROJECT_NAME} ${MOSQUITTO_LIBRARIES})
endif (MOSQUITTO_FOUND)

find_package(Mosquittopp)
if(MOSQUITTOPP_FOUND)
  include_directories(${MOSQUITTOPP_INCLUDE_DIRS})
#  target_link_libraries (${PROJECT_NAME} ${MOSQUITTOPP_LIBRARIES})
endif (MOSQUITTOPP_FOUND)

add_executable(CMakeTest
        ${project_sources}
        ${project_headers}
        ${ui_wrap}
        ${moc_sources})

target_link_libraries(CMakeTest
        PUBLIC
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets)

target_link_libraries(CMakeTest ${MOSQUITTOPP_LIBRARIES})


