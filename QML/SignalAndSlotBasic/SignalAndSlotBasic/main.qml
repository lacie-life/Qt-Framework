import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 1000
    height: 1000
    title: qsTr("Signal and Slot basic")

    Rectangle {
        id: textRect
        width: 600
        height: 600

        ScrollView {
            id: sview
            anchors.left: parent.left
            anchors.top: parent.top
            height: 500
            width:parent.width

            TextArea {
                id: msgbody
                height: 500
                text: "Work Updates:"
                font.pointSize: 20
                color: "red"

                Connections {
                    target: sensorRef
                    onSensorRefresh: {
                        msgbody.text = msgbody.text + "\n" +  sensorName + " " +
                                param + " " + value;
                    }
                }

            }
        }
    }

    Button{
        id: button1
        anchors.top: textRect.bottom
        text: "start test"
        onClicked: {
            sensorRef.startTest()
        }
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

