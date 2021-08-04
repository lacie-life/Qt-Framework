import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    id: root
    Item {
        id: code

        function performClick(){
            var max = root.height - box.width
            box.x = (box.x == 0) ? max : 0
        }
    }


    Rectangle{
        id: box
        color:  swapcolor()
        width: 100
        height: 100
        x: 0
        y: (parent.height / 2) - (height / 2)

        // Function can be in a component
        function swapcolor(){
            return area.pressed ? "orange" : "gray"
        }

        MouseArea{
            id: area
            anchors.fill: parent

            onClicked: {
                print("Javascript in signal handler")

//                var max = root.height - box.width
//                box.x = (box.x == 0) ? max : 0
                code.performClick()

            }
        }
    }
}
