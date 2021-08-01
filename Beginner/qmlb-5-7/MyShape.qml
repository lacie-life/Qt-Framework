import QtQuick 2.0

Item {
    id: root
    property color color: "gray"
    property string text: "title"

    width: 100
    height: 100


    Rectangle {
        color: root.color
        anchors.fill: parent

        Text {
            text: root.text
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            drag.target: root.parent
            onPressed: root.z++
        }
    }


}




