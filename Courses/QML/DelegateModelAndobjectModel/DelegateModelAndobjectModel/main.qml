import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml.Models 2.1
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.12

import "qrc:/"

Window {
    id: window
    visible: true
    width: 1000
    height: 1000
    title: qsTr("Delegate and object Models")


    Column{
        anchors.fill: parent
        Button {
            text: "Object model"
            onClicked: {
                loader.source = "ObjectComp.qml"
            }
        }
        Button {
            text: "Delegate model"
            onClicked: {
                loader.source = "ObjRect.qml"
            }
        }

        //Package to enable delegates with a shared context to be provided to multiple views.
        Button {
            text: "Package Delegate model"
            onClicked: {
                loader.source = "PackageDelegate.qml"
            }
        }
        Loader {
            id: loader
            height: 600
            width: 600
            focus: true
        }
    }


    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
