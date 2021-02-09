import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4

Window {
    id: window
    visible: true
    width: 900
    height: 900
    title: qsTr("QML Image Example")


    Rectangle{
        id: borderRectangle
        color: "tan"
        width: 600
        height: 600
        anchors.centerIn: parent
        Text{

                id: textname
                text: qsTr("This is background text")
                font.pointSize: 20
                color: "red"
                anchors.centerIn: parent

        }

        Image {
            id: birdImage

            width: 500
            height: 500
            opacity: 0.4
            anchors.centerIn: parent

            source: "bird_small.jpg"
            fillMode: Image.Stretch //Stretch PreserveAspectFit, PreserveAspectCrop,Tile,TileVertically,TileHorizontally,Pad
            mirror: false
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            autoTransform : true
            asynchronous : true
            onStatusChanged:  console.log('status: ' + birdImage.status)

/*
            sourceSize.width: 600
            sourceSize.height: 600
            sourceClipRect: Qt.rect(0, 0, 100, 100)
*/

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
