import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string username: "bryan"
    property string password: "password"
    property string status: "Failed"

    Popup {
        id: statusPopup
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        anchors.centerIn: parent
        width: 200
        height: 300
        modal: true
        focus: true

        Label {
            id: statusLabel
            anchors.centerIn: parent
            text: status
            font.bold: true
        }
    }


    Column {
        id: column
        width: 288
        height: 159
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Grid {
            id: grid
            width: 300
            height: 100
            spacing: 10
            columns: 2

            Label {
                id: label
                text: qsTr("Username")
            }

            TextField {
                id: txtUsername
                text: qsTr("")
            }

            Label {
                id: label1
                text: qsTr("Password")
            }

            TextField {
                id: txtPassword
                text: ""
                echoMode: TextInput.Password
            }

        }

        Button {
            id: button
            text: qsTr("Login")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if(username === txtUsername.text && password === txtPassword.text) status = "Hello!"
                statusPopup.open()
            }
        }
    }


}
