import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15


Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("Quad Path Example")

    Shape {
        anchors.centerIn: parent

        ShapePath {
            id: quadcurve
            strokeColor: "red"
            strokeWidth: 10
            fillColor: "blue"
            startX: 0
            startY: 0

            PathQuad { x: 200; y: 0; controlX:100; controlY: -100 }
            PathQuad { x: 0;   y:0;  controlX:100; controlY: 100 }

            PathQuad { x: 0;   y:200; controlX:100; controlY:100 }
            PathQuad { x: 0;   y:0;  controlX:-100; controlY: 100 }

            PathQuad { x: -200;   y:0; controlX:-100; controlY:-100 }
            PathQuad { x: 0;   y:0; controlX:-100; controlY:100 }

            PathQuad { x: 0;   y:-200; controlX:100; controlY:-100 }
            PathQuad { x: 0;   y:0; controlX:-100; controlY:-100 }



        }
    }
}
