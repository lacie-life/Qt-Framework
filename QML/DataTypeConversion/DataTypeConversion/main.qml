import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 1.4

import org.qmlExample 1.0



Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Message {
        id: messageObj
        onStatusUpdated: {
            console.log("change status: enum value: " + status)
            console.log("changed status: " + getEnumString(status))
            if (status === Message.OK)
                console.log("Message " + getEnumString(Message.OK))
            if (status === Message.Temp)
                console.log("Message from environmnet " + getEnumString(Message.Temp))
        }
    }

    Rectangle {
        id: childrenRect
        ComboBox {
            id: comboItem
            width: 200
            currentIndex: 2
            model: ListModel {
                id: msgStatus
                ListElement { text: "Error"; color:"yellow" }
                ListElement { text: "OK"; color: "green" }
                ListElement { text: "Fault"; color: "brown" }
                ListElement { text: "InProgress"; color: "brown" }
            }
            onCurrentIndexChanged: {
                if (currentIndex == 0)
                    messageObj.statusUpdated(Message.Error)
                else if (currentIndex == 1)
                    messageObj.statusUpdated(Message.OK)
                else if (currentIndex == 2)
                    messageObj.statusUpdated(Message.Fault)
                else if (currentIndex == 3)
                    messageObj.statusUpdated(Message.InProgress)
                else
                    messageObj.statusUpdated(Message.OK)
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
