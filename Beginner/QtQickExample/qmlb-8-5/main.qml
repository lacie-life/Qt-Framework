import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Row {
        id: row
        anchors.fill: parent

        Column {
            id: column
            width: 150
            height: 400
            spacing: 10

            CheckBox {
                id: checkBox
                text: qsTr("Normal")
            }

            CheckBox {
                id: checkBox1
                text: qsTr("Not checkable")
                checkable: false
            }

            CheckBox {
                id: checkBox2
                text: qsTr("Tristate")
                tristate: true
            }

            CheckBox {
                id: checkBox3
                text: qsTr("Exclusive")
                autoExclusive: true
            }

            CheckBox {
                id: checkBox4
                text: qsTr("Repeat")
                autoRepeat: true
            }

            Button {
                id: button
                text: qsTr("Reset")
            }
        }

        Column {
            id: column1
            width: parent.width - x
            height: parent.height

            Label {
                id: label
                text: qsTr("Status here")
                font.pointSize: 35
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Connections {
        target: button
        onClicked: {
            checkBox.checkState = Qt.Unchecked
            checkBox1.checkState = Qt.Unchecked
            checkBox2.checkState = Qt.Unchecked
            checkBox3.checkState = Qt.Unchecked
            checkBox4.checkState = Qt.Unchecked
            label.text = "Status here"

        }
    }

    Connections {
        target: checkBox
        onClicked: label.text = "checkbox = " + target.checkState
    }
    Connections {
        target: checkBox1
        onClicked: label.text = "checkbox = " + target.checkState
    }
    Connections {
        target: checkBox2
        onClicked: label.text = "checkbox = " + target.checkState
    }
    Connections {
        target: checkBox3
        onClicked: label.text = "checkbox = " + target.checkState
    }
    Connections {
        target: checkBox4
        onClicked: label.text = "checkbox = " + target.checkState
    }

}



/*##^##
Designer {
    D{i:1;anchors_height:400;anchors_width:200}
}
##^##*/
