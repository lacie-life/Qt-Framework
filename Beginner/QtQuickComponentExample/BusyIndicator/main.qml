import QtQuick 2.12
import QtQuick.Window 2.12

/*
  add label
  add busyIndicator
  use the editor to add a mouse area
  */
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    BusyIndicator {
        id: busyIndicator
        x: 185
        y: 251
        width: 133
        height: 109
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Label {
        id: label
        x: 304
        y: 150
        text: qsTr("Progress = ") + busyIndicator.running
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: mouseArea
            width: 100
            height: 100
            anchors.fill: parent
            onClicked: {
                if(busyIndicator.running) {
                    console.log("Turning off")
                    busyIndicator.running = false
                } else {
                    console.log("Turning on")
                    busyIndicator.running = true
                }
            }

        }
    }






}
