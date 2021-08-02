import QtQuick 2.12
import QtQuick.Window 2.12

/*
Explain Imports
Explain what happens when you import
https://doc.qt.io/qt-5/qtquickcontrols-index.html
versions going away in Qt 6
drag some controls on the window

*/
import QtQuick.Controls 2.3


Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    BusyIndicator {
        id: busyIndicator
        x: 285
        y: 225
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Dial {
        id: dial
        x: 90
        y: 188
        width: 135
        height: 160
    }

    CheckBox {
        id: checkBox
        x: 417
        y: 117
        text: qsTr("Check Box")
    }

    DelayButton {
        id: delayButton
        x: 422
        y: 210
        text: qsTr("Delay Button")
    }

}


