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
    title: qsTr("Hello World")

    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        height: 20
        width: 300
        Text {
            id: dateComp
            color: "red"
            font.pointSize: 10
            function update() {
                dateComp.text = Date()
            }
        }

        Timer {
            id: timeComp
            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: dateComp.update()
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 1000
        height: 1000
        color: "red"
        Column {
            spacing: 10
            Row{
                spacing: 10
                Text {
                    height: 100
                    text:"message: "
                    font.pointSize: 20
                }
                Text {
                    id: msgid
                    text: msg.message
                    font.pointSize: 20
                    Component.onCompleted: {
                        msg.message = "InitialMessage"  // invokes Message::setmessage()
                    }
                }
            }

            Text {
                height: 100
                text: "Creation date: " + msg.creationDate
                font.pointSize: 20

                Component.onCompleted: {
                    msg.creationDate = new Date()
                }
            }

            Row{
                spacing: 10
                Text {
                    height: 100
                    text:"author: "
                    font.pointSize: 20
                }
                Text {
                    id: nameid
                    text: msg.author
                    font.pointSize: 20
                    Component.onCompleted: {
                        msg.author = "Gaurav"  // invokes Message::setAuthor()
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
            TextArea {
                id: msgbody
                height: 500
                text: "Work Updates:"
                font.pointSize: 20
                MouseArea {
                    anchors.fill: parent
                }
                Connections {
                    target: msg
                    onThreadCompleted: {
                        msgbody.text = msgbody.text + "\n" +  msgUpdate;
                    }
                }

            }
            Row {
                spacing: 5
                Button {
                    id: startThread
                    text: "inherited from Qthread"
                    onClicked: {
                        msg.startThreadCall("Qthred inherited", 0)
                    }
                }
                Button {
                    id: startThreadMove
                    text: "thread using move thread"
                    onClicked: {
                        msg.startThreadCall("Move to Qthread", 1)
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

