import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        id: column
        width: 208
        height: 340
        spacing: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Label {
            id: label
            text: qsTr("Value")
            font.pointSize: 50
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Dial {
            id: dial
            anchors.horizontalCenter: parent.horizontalCenter
            //onMoved: label.text = Math.round(dial.value * 100)
        }
    }

    Connections {
        target: dial
        onMoved: label.text = Math.round(target.value * 100)
    }


}
