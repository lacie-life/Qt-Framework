import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    property alias name: textField.text
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 1.")
        anchors.verticalCenterOffset: -185
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
    }

    Column {
        id: column
        x: 201
        y: 14
        width: 200
        height: 230
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: label
            text: qsTr("Enter your name")
        }

        TextField {
            id: textField
            placeholderText: qsTr("Text Field")
        }
    }
}
