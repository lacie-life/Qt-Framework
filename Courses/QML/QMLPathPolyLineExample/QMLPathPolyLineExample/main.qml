import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("Path Poly LineExample")

    Text {
        id: centerCord
        text: qsTr(".(0,0)")
        color: "black"
        anchors.centerIn: parent
        z:100
    }

    Shape {
        anchors.centerIn: parent
        z:1

        ShapePath {
            id: polyShape

            strokeWidth: 10
            strokeColor: "blue"

            startX: 0
            startY: 0
            fillColor: "red"

            PathPolyline {
                id: hexagonPoly
                path: [ Qt.point(100,0),
                    Qt.point(150,50),
                    Qt.point(100,100),
                    Qt.point(0,100),
                    Qt.point(-50,50),
                    Qt.point(0,0),
                    Qt.point(100,0)
                ]

            }
        }
    }

}
