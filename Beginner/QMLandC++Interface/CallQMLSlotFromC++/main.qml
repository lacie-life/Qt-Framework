import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

//This is the root context

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Connections {
        target: testing //our C++ object on the root context
        onNotice: {
            console.log("Slot called from C++")
            lblStatus.text = data //get this from the signal
        }
    }

    Column {
        id: column
        width: 228
        height: 159
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 25

        Label {
            id: lblTitle
            text: "Connecting to Signals"
            font.pointSize: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: lblStatus
            text: "Status"
            font.pointSize: 25
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            id: row
            width: 200
            height: 400
            spacing: 25

            Button {
                id: btnStart
                text: qsTr("Start")

                //Call a slot
                onClicked: testing.start()

            }

            Button {
                id: btnStop
                text: qsTr("Stop")

                //Call a slot
                onClicked: testing.stop()
            }
        }
    }
}

