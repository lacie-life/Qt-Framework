import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import "qrc:/"

Item {
    width: 500
    height: 500
    anchors.left: parent.left
    anchors.leftMargin: 20
    Component {
        id: contactDelegate
        Item {
            id:wrapper
            width: gridViewItem.cellWidth; height: gridViewItem.cellHeight
            Column {
                anchors.fill: parent
                spacing: 5
                Image {
                    id: imageComp
                    source: portrait;
                    width: 50
                    height: 50
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: contactInfo
                    width: 100
                    text: name + ": " + number
                    color: GridView.isCurrentItem ? "red" : "black"
                    font.pixelSize: 15
                }
            }
        }
    }


    GridView {
        id: gridViewItem
        anchors.left: parent.left
        anchors.leftMargin: 40
        width: 600
        height: 500
        cellWidth: 150; cellHeight: 200
        //flow: GridView.FlowTopToBottom
        //layoutDirection: Qt.RightToLeft
        //verticalLayoutDirection: GridView.BottomToTop
        focus:true
        displaced: Transition {
               NumberAnimation { properties: "x,y"; duration: 1000 }
           }

        model: NameModel {}
        delegate:contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }

    }
    Gradient {
        id: clubcolors
        GradientStop { position: 0.0; color: "#8EE2FE"}
        GradientStop { position: 0.66; color: "#7ED2EE"}
    }

}

