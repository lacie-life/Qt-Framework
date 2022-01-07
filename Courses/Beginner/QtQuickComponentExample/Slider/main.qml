import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Grid {
        id: grid
        width: 480
        height: 85
        spacing: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        columns: 2

        Slider {
            id: slider
            width: 300
            stepSize: 0.1
            value: 0
        }

        Label {
            id: label
            text: "0"
            font.pointSize: 25
            font.bold: true
        }
    }

    Connections {
        target: slider
        onMoved: label.text = Math.round(slider.value * 100)
    }

}


/*##^##
Designer {
    D{i:1;anchors_height:85;anchors_width:480}
}
##^##*/
