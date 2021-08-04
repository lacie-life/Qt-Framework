import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function calc() {
        var num = sbWidth.value * sbHeight.value
        label.text = num + " sqft"
    }


    Column {
        id: column
        width: 200
        height: 169
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10

        Label {
            id: label
            text: qsTr("0 sqft")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 25
            font.bold: true
        }

        Grid {
            id: grid
            width: 400
            height: 400
            rows: 2
            columns: 2
            spacing: 10

            Label {
                id: label1
                text: qsTr("Width")
            }

            SpinBox {
                id: sbWidth
            }

            Label {
                id: label2
                text: qsTr("Height")
            }

            SpinBox {
                id: sbHeight
            }

        }
    }

    Connections {
        target: sbWidth
        onValueModified: calc()
    }

    Connections {
        target: sbHeight
        onValueModified: calc()
    }

}
