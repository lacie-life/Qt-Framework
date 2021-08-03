import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: root
    property var value: 0

    Row {
        id: row
        width: 236
        height: 51
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        RoundButton {
            id: roundButton
            text: "+"
            font.pointSize: 15
            font.bold: true
            onClicked: value++
        }

        RoundButton {
            id: roundButton1
            text: "-"
            font.pointSize: 15
            font.bold: true
            onClicked: value--
        }

        Label {
            id: label
            text: "Value: " + root.value
            font.bold: true
            font.pointSize: 25
        }
    }
}
