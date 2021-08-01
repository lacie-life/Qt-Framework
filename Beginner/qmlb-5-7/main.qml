
import QtQuick 2.12
import QtQuick.Window 2.12

//Anchors

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    MyShape {
        id: shareCentral
        anchors.centerIn: parent

        text: "Center"

        Rectangle {
            width: 25
            height: 25
            color: "pink"
            //no anchor by default
            //anchors.centerIn: parent
            //anchors.fill: parent
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }

    MyShape {
        id: shapeTop
        text: "Top"
        color: "green"
        anchors.bottom: shareCentral.top
        anchors.left: shareCentral.left
    }


    MyShape {
        id: shapeBottom
        text: "Bottom"
        color: "blue"
        anchors.top: shareCentral.bottom
        anchors.left: shareCentral.left
    }

    MyShape {
        id: shapeLeft
        text: "Left"
        color: "red"
        anchors.top: shareCentral.top
        anchors.right: shareCentral.left
    }

    MyShape {
        id: shapeRight
        text: "Right"
        color: "yellow"
        anchors.top: shareCentral.top
        anchors.left: shareCentral.right
    }
}
