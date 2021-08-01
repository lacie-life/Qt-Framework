import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item{
        id: root
        rotation: 0
        anchors.centerIn: parent
        //anchors.fill: parent

        Rectangle{
            id: yellowRect
            color: "yellow"
            width: 300
            height: 300
            radius: width
            opacity: 0.5
            border.width: 2
            border.color: "black"
            anchors.centerIn: parent

            transform: Translate{y: 100; x: -100}
        }

        Rectangle{
            id: redRect
            color: "red"
            width: 300
            height: 300
            radius: width
            opacity: 0.5
            border.width: 2
            border.color: "black"
            anchors.centerIn: parent

            transform: Translate{y: 100; x: 100}
        }

        Rectangle{
            id: blueRect
            color: "blue"
            width: 300
            height: 300
            radius: width
            opacity: 0.5
            border.width: 2
            border.color: "black"
            anchors.centerIn: parent

            transform: Translate{y: -100}
        }

        Rectangle{
            id: centerArea
            width: 50
            height: 50
            radius: width
            opacity: 1
            border.width: 2
            border.color: "black"
            anchors.centerIn: parent
        }

        Rectangle{
            id: centerCircle
            width: 5
            height: 5
            radius: width
            opacity: 1
            border.width: 2
            border.color: "black"
            anchors.centerIn: parent
        }

        RotationAnimator{
            target: root
            from: 360
            to: 0
            duration: 5000
            direction: RotationAnimation.Counterclockwiser
            loops: Animation.Infinite
            running: true
        }
    }
}
