import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MyButton {
        id: myButton
        source: "qrc:/files/images/up.png"
        width: 100
        height: 100

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -134
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: console.log("Up clicked")
    }

    MyButton {
        id: myButton1
        source: "qrc:/files/images/down.png"
        x: 270
        y: 236
        width: 100
        height: 100

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: console.log("Down clicked")
    }



}
