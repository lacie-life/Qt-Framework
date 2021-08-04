import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

/*
QML Lives on top of C++ Qt
You can expose c++ classes to QML
C++ is an advanced topic not covered in this course
C++ and QML commuicate via signals and slots
open main.cpp and explain whats going on
*/

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: root

    Column{
        id: column
        width: 200
        height: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 25

        Label{
            id: label
            text: qsTr("Call C++ Slot")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button{
            id: button
            text: qsTr("Click Me")

            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                // Call a slot
                testing.bark()

                // Can not call a non-slot  - must be a property
                var num = testing.number()
                print(num)
            }
        }
    }
}
