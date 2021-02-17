import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15
import QtQuick 2.15



Window {
    width: 1000
    height: 1000
    visible: true
    title: qsTr("Circle using Path Cubic")

    property double rad_drift: 55.19
    property double nrad_drift: -55.19

    Text {
        id: centerif
        text: "(0,0)"
        color: "blue"
        anchors.centerIn: parent
    }

    Shape {
        anchors.centerIn: parent


        ShapePath {
            strokeColor: "red"
            strokeWidth: 5
            startX: 0
            startY: -100
            PathCubic {
                x: 100; y:0
                control1X: rad_drift; control1Y: -100;
                control2X: 100; control2Y:nrad_drift;
            }
            PathCubic {
                x: 0; y: 100;
                control1X: 100; control1Y: rad_drift;
                control2X: rad_drift; control2Y: 100;
            }
            PathCubic {
                x: -100; y: 0;
                control1X: nrad_drift; control1Y: 100;
                control2X: -100; control2Y: rad_drift;
            }
            PathCubic {
                x: 0; y: -100;
                control1X: -100; control1Y: nrad_drift;
                control2X: nrad_drift; control2Y: -100;
            }

        }

        ShapePath {
            strokeColor: "blue"
            strokeWidth: 1
            startX: 0
            startY:-100
            PathLine {
                x: 100; y: 0;
            }
            PathLine {
                x: 0; y: 100;
            }
            PathLine {
                x: -100; y: 0;
            }
            PathLine {
                x: 0; y: -100;
            }
        }
    }
}
