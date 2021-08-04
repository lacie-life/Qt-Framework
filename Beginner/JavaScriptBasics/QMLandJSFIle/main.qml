import QtQuick 2.15
import QtQuick.Window 2.15

import "code.js" as Code

//External javascript files
//https://doc.qt.io/qt-5/qtqml-javascript-expressions.html

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id: root

    Rectangle{
        id: box
        color: Code.swapColor(area)
        width: 100
        height: 100
        x: 0
        y: (parent.height / 2) - (height / 2)

        MouseArea{
            id: area
            anchors.fill: parent
            onClicked: Code.performClick(root, box)

        }
    }
}
