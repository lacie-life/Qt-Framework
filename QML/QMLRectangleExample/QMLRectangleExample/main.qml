import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4

Window {
    id: window
    visible: true
    width: 1000
    height: 1000
    title: qsTr("Rectangle Component")

    Rectangle {
        id: rectangleID

        anchors.left: parent.left
        anchors.top:parent.top
        anchors.leftMargin: 20
        anchors.topMargin:  20

        width: 300
        height: 300
        color: "red"
        border.color: "green"
        border.width: 7
        radius: 300   //Becomes circle, If we set radius equal to width and height
        opacity: 0.7

        antialiasing: true   // improves the appearance of a rounded rectangle

        gradient: Gradient {
               GradientStop { position: 0.0; color: "yellow" }
               GradientStop { position: 0.5; color: "orange" }
               GradientStop { position: 1.0; color: "red" }
           }
    }

    Rectangle {
        id: rectangle2

        anchors.left: parent.left
        anchors.top:parent.top

        anchors.leftMargin: 100
        anchors.topMargin:  100

        width: 300
        height: 200
        color: "green"
        border.color: "red"
        border.width: 7
        radius: 15
        opacity: 0.3


    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
