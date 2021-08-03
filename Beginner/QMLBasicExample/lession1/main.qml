import QtQuick 2.12
import QtQuick.Window 2.12

// ID - must uniquie
// Root Object - there can be only one
// X Y Z


// Top level object
Window {
    id:root

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Image {
        id: myImage
        source: "https://upload.wikimedia.org/wikipedia/commons/0/0b/Qt_logo_2016.svg"
        width: 150
        height: 100
        x: 100
        y: 50
        z: 3
        opacity: 1
        // anchors.centerIn: parent

//        Rectangle{
//            color: "red"
//            width: parent.width
//            height: parent.height
//            opacity: 0.5
//        }
    }

//    TextInput{
//        id: myInput
//        text: "Hello World"
//        anchors.centerIn: parent
//        font.pixelSize: 15
//    }

//    Text {
//        id: myText
//        text: myInput.text
//        font.pixelSize: 15
//    }

    Rectangle{
        color: "red"
        width: 200
        height: 200
        x: 50
        y: 50
        opacity: 0.5
        z: 2
    }

    Rectangle{
        color: "blue"
        width: 200
        height: 200
        x: 150
        y: 150
        opacity: 0.5
        z: 1
    }

}
