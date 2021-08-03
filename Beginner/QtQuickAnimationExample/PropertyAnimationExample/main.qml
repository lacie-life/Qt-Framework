import QtQuick 2.15
import QtQuick.Window 2.15

// Transformation, its about transforming the objects appearance through changes

// Positioning X/Y

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    id: root

    Rectangle{
        id: myShape
        color: "red"
        width: 100
        height: 100
        x: 0
        y: (parent.height / 2) - (height / 2)

        PropertyAnimation{
            id: animationRight
            target: myShape
            property: "x"
            to: root.width - myShape.width
            duration: 500
        }

        PropertyAnimation{
            id: animationLeft
            target: myShape
            property: "x"
            to: 0
            duration: 500
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(myShape.x == 0){
                    animationRight.start()
                }
                else{
                    animationLeft.start()
                }
            }
        }
    }
}
