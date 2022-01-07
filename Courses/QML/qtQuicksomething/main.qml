import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Extras 1.4

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CircularGauge {
        id: circularGauge
        x: 201
        y: 113
    }

    DelayButton {
        id: delayButton
        x: 71
        y: 31
        text: qsTr("Button")
    }

    ToggleButton {
        id: toggleButton
        x: 91
        y: 283
        text: qsTr("Button")
    }
}


