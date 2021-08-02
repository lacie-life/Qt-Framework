import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#686060"
    title: qsTr("Hello World")

    Row {
        id: row
        width: 640
        height: 45
        spacing: 5

        Button {
            id: button
            text: qsTr("Cat")
        }

        Button {
            id: button1
            text: qsTr("Dog")
        }

        Button {
            id: button2
            text: qsTr("Fish")
        }

        Button {
            id: button3
            text: qsTr("Bird")
        }
    }

    Image {
        id: image
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 51
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }

    Connections {
        target: button
        onClicked: image.source = "qrc:/images/images/cat.jpg"
    }

    Connections {
        target: button1
        onClicked: image.source = "qrc:/images/images/dog.jpg"
    }

    Connections {
        target: button2
        onClicked: image.source = "qrc:/images/images/fish.jpg"
    }

    Connections {
        target: button3
        onClicked: image.source = "qrc:/images/images/bird.jpg"
    }
}

/*##^##
Designer {
    D{i:6;anchors_height:424;anchors_width:640;anchors_x:0;anchors_y:51}
}
##^##*/
