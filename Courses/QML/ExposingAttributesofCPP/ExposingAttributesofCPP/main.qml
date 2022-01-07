import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Item {
        id: rootItem
        width: 900
        height: 900

        Rectangle {
            anchors.centerIn: parent
            width: 800
            height: 800
            color: "gray"
            Column {
                Row{
                    spacing: 10
                    Text {
                        height: 100
                        text:"author: "
                        font.pointSize: 30
                    }
                    Text {
                        id: name
                        text: msg.author
                        font.pointSize: 30
                        Component.onCompleted: {
                            msg.author = "Jonah"  // invokes Message::setAuthor()
                        }
                    }
                }
                Row{
                    spacing: 10
                    Text {
                        height: 100
                        text:"new author"
                        font.pointSize: 30

                    }
                    TextField {
                        id: nameIn
                        height: 80
                        width: 300
                        font.pointSize: 30
                        onEditingFinished: {
                            msg.author = text
                        }

                    }
                }
                Text {
                    height: 100
                    text: msg.creationDate
                    font.pointSize: 30

                    Component.onCompleted: {
                        msg.creationDate = new Date()
                    }
                }
                TextArea {
                    id: msgbody
                    height: 200
                    text: "initial text"
                    font.pointSize: 30
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var result = msg.postMessage("Hello from QML")
                            msgbody.text = result;
                            msg.refresh();
                        }
                    }

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
