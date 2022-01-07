import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import org.qmlExample 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Item {
        id: rootItem
        anchors.centerIn: parent
        width: 900
        height: 900

        Message {
            id: messageObj
            author: "Gaurav"
            creationDate: new Date();
        }
        Message {
            id: messageObj2
            author: "User2"
            creationDate: new Date();
        }

        Rectangle {
            anchors.centerIn: parent
            width: 800
            height: 800
            color: "gray"
            Column {
                spacing: 5
                Row{
                    spacing: 10
                    Text {
                        height: 100
                        text:"author1: "
                        font.pointSize: messageObj.pFont
                        color: messageObj.pColor
                    }
                    Text {
                        id: name
                        text: messageObj.author
                        font.pointSize: messageObj.pFont
                        color: messageObj.pColor
                    }
                }
                Row{
                    spacing: 10
                    Text {
                        height: 100
                        text:"author2: "
                        font.pointSize: messageObj2.pFont
                        color: messageObj2.pColor
                    }
                    Text {
                        id: name2
                        text: messageObj2.author
                        font.pointSize: messageObj2.pFont
                        color: messageObj2.pColor
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
                            messageObj.author = text
                        }

                    }
                }
                Text {
                    height: 100
                    text: messageObj.creationDate
                    font.pointSize: messageObj.pFont
                    color: messageObj.pColor

                }
                TextArea {
                    id: msgbody
                    height: 200
                    text: "initial text"
                    font.pointSize: 30
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var result = messageObj.postMessage("Hello from QML")
                            msgbody.text = result;
                            messageObj.refresh();
                        }
                    }

                }
                Button {
                    id : increasFont
                    text: "Increase Font"
                    onClicked: {
                        messageObj2.pFont = messageObj2.pFont +1
                        messageObj.pFont = messageObj.pFont + 1
                    }
                }
                Button {
                    id : decreaseFont
                    text: "Decrease Font"
                    onClicked: {
                        messageObj2.pFont = messageObj2.pFont - 1
                        messageObj.pFont = messageObj.pFont - 1
                    }
                }
                Row {
                    spacing: 5
                    Button {
                        id : colGreen
                        text: "Green"
                        onClicked: {
                            messageObj2.pColor = "Green"
                            messageObj.pColor = "Green"
                        }
                    }
                    Button {
                        id : colBlue
                        text: "Blue"
                        onClicked: {
                            messageObj2.pColor = "Blue"
                            messageObj.pColor = "Blue"
                        }
                    }
                    Button {
                        id : colRed
                        text: "Red"
                        onClicked: {
                            messageObj2.pColor = "Red"
                            messageObj.pColor = "Red"
                        }
                    }
                }

            }
        }
    }
}
