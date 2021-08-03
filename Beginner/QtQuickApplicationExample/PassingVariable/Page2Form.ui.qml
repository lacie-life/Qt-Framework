import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 600
    height: 400

    property alias name: label.text

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Column {
        id: column
        y: 68
        width: 358
        height: 143
        spacing: 10
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: label
            text: qsTr("Click Me !!!")
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: button
            text: qsTr("Button")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: name = "Hello World"
        }
    }
}

/*##^##
Designer {
    D{i:0}D{i:5;locked:true}D{i:3}
}
##^##*/
