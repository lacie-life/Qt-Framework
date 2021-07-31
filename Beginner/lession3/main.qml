import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        id: myItem
        anchors.centerIn: parent
        width: 100
        height: 100

        Rectangle{
            color: "red"
            anchors.fill: parent
        }
    }
}
