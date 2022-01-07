import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.2
import "qrc:/"

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Worker Script")


    Rectangle {
        id: msgRect
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
        width: 600; height: 300
        color: "red"

        Text {
            id: myText
            color: "blue"
            font.pointSize: 20
            text: 'Click in rectangle'
        }

        WorkerScript {
            id: myWorker
            source: "workerscript.mjs"

            onMessage: {

                myText.text = messageObject.reply
                myText.text = myText.text + " " + messageObject.test
            }

        }

        MouseArea {
            anchors.fill: parent
            onClicked:myWorker.sendMessage({ 'x': mouse.x, 'y': mouse.y, 'model':listView.model })
        }

    }

    ScrollView {
        anchors.top: parent.top
        anchors.left: msgRect.right
        anchors.leftMargin: 20
        anchors.topMargin:  20
        width: 200
        height:300

        ListView {
            id: listView

            width: 200
            model: FruitModel {}
            delegate: fruitDelegate
        }
    }
    Component {
        id: fruitDelegate
        Row {
            spacing: 10
            Text { text: name; font.pointSize: 20 }
            Text { text: '$' + cost;  font.pointSize: 20 }
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
