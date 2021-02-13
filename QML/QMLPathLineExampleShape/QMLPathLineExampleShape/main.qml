import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("QML Path line example")

    Text {
        id: textReference
        text: "(0,0)"
        color: "black"
        anchors.centerIn: parent
        z:100
    }

    Shape {
        id: shapeComp
        anchors.centerIn: parent
        z:1

        ShapePath {
            id: shapePathComp
            strokeColor: "red"
            strokeWidth: 16
            fillColor: "lightblue"
            capStyle: ShapePath.SquareCap
            joinStyle: ShapePath.RoundJoin

            startX: 100
            startY: 100

            PathLine { relativeX: 0; relativeY: -50 }   // (100, 50)
            PathLine { relativeX: -50; relativeY: 0 }   // (50 , 50)
            PathLine { relativeX: 50; relativeY: 50 }   // (100, 100)

            PathLine { x: 100; y: 200 }
            PathLine { x: 200; y: 200 }
            PathLine { x: 200; y: 100 }
            PathLine { x: 0; y: 100 }


        }

    }

}
