import QtQuick 2.12
import QtQuick.Window 2.12

//Frame - super simple - just eye candy
//Also talk about the popup
//https://doc.qt.io/archives/qt-5.7/qml-qtquick-controls2-frame.html
import QtQuick.Controls 2.3



Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Popup {
        id: popup
        anchors.centerIn: parent
        width: 200
        height: 200
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Column {
            spacing: 25
            anchors.fill: parent

            Label {
                id: lblButter
                text: "Butter = " + chkButter.checked
            }
            Label {
                id: lblSyrup
                text: "Syrup = " + chkSyrup.checked
            }
            Label {
                id: lblFruit
                text: "Fruit = " + chkFruit.checked
            }

            Button {
                id: closeButton
                text: "Close"
                //onClicked: popup.visible = false
                onClicked: popup.close()
            }
        }
    }

    Frame {
        id: frame
        width: 134
        height: 268
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Column {
            id: column
            spacing: 25
            anchors.fill: parent

            CheckBox {
                id: chkButter
                text: qsTr("Butter")
            }

            CheckBox {
                id: chkSyrup
                text: qsTr("Syrup")
            }

            CheckBox {
                id: chkFruit
                text: qsTr("Fruit")
            }

            Button {
                id: button
                text: qsTr("Save")
                 //onClicked: popup.visible = true
                onClicked: popup.open()
            }
        }
    }

}


/*##^##
Designer {
    D{i:2;anchors_height:400;anchors_width:200}
}
##^##*/
