import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQml 2.15

Window {
    id: window
    visible: true
    width: 1000
    height: 1000
    title: qsTr("Binding and connections")


    Rectangle {
        id: rectRoot
        width: 800
        height: 800
        anchors.centerIn: parent
        color: "red"
        Column {
            Text {
                id: textMsg
                width:400
                height: 100
                font.pointSize: 20
                text: sensor_update.message
            }
            Text {
                id: messageText
                text: "initial mesage"
                width:400
                height: 100
                font.pointSize: 20

            }

            Row {
                Text {
                    height: 100
                    font.pointSize: 20
                    text: "X coordinate: "
                }

                Text {
                    id: xcoord

                    width:100
                    height: 100
                    font.pointSize: 20
                    text: "x cord value"
                }
            }

            TextEdit {
                id: textField;

                width: 400
                height: 100
                font.pointSize: 20
                text: "Type here"
            }
            Binding {
                target: sensor_update;
                property: "message";
                value: textField.text
            }
            Rectangle {
                id: clickArea
                height: 300
                width: 300
                color:"blue"
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    Binding {
                        target:xcoord
                        property: "text"
                        restoreMode: Binding.RestoreBindingOrValue
                        value: mouseArea.mouseX
                        Binding on value {
                            when: mouseArea.pressed
                            value: mouseArea.mouseX
                        }
                    }
                    onClicked: {
                        console.log("slot from default onClicked function.")
                    }

                    Connections {
                        function onClicked(mouse) {
                            clickArea.foo(mouse)
                        }
                    }
                }
                Connections {
                    target: mouseArea
                    function onClicked(mouse) {
                        clickArea.foo2(mouse)
                    }

                }
                function foo(mouse) {
                    console.log("foo : mouse click from conenction")
                    console.log("coord: " + mouse.x + "," + mouse.y)
                }
                function foo2(mouse) {
                    console.log("foo2 : mouse click from conenction")
                    console.log("coord: " + mouse.x + "," + mouse.y)
                }
            }

            Connections {
                target: sensor_update
                function onMessageChanged1(msg) {
                    console.log("MessageChanged() signal slot called:: " + msg)
                }
            }
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
