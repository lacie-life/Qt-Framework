import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

//    Column{
//        anchors.centerIn: parent
//        spacing: 2

//        MyShape{
//            color: "red"
//        }

//        MyShape{
//            color: "green"
//        }

//        MyShape{
//            color: "blue"
//        }

//    }


//        Row{
//            anchors.centerIn: parent
//            spacing: 2

//            MyShape{
//                color: "red"
//            }

//            MyShape{
//                color: "green"
//            }

//            MyShape{
//                color: "blue"
//            }

//        }

//    Grid{
//        anchors.centerIn: parent
//        spacing: 5
//        rows: 1
//        columns: 1

//        MyShape{color: "red"}
//        MyShape{color: "yellow"}
//        MyShape{color: "gray"}
//        MyShape{color: "green"}
//        MyShape{color: "blue"}
//        MyShape{color: "teal"}

//    }

    Rectangle{
        color: "pink"
        anchors.centerIn: parent
        width: 300
        height: 400

        clip: false

        Flow{
            anchors.centerIn: parent

            flow: Flow.TopToBottom

            MyShape{color: "red"}
            MyShape{color: "green"}
            MyShape{color: "blue"}
            MyShape{color: "gray"}
            MyShape{color: "black"}
        }
    }

}
