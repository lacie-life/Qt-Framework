import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    property alias name: label.text
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }

    Label {
        id: label
        x: 284
        y: 106
        text: qsTr("Here")
    }
}