import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import "qrc:/"

Item {
    Component {
        id: contactDelegate
        Rectangle {
            id: wrapper
            width: contactInfo.width
            height: contactInfo.height
            color: ListView.isCurrentIndex ? "black" : "red"
            Image {
                id: imageComp
                anchors.left: parent.left
                source: portrait;
                width: 80
                height: 80
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                id: contactInfo
                anchors.left: imageComp.right
                text: name + ": " + number
                color: wrapper.ListView.isCurrentItem ? "red" : "black"
                font.pixelSize: 24
            }
        }

    }

    Component
    {     //instantiated when header is processed
        id: bannercomponent
        Rectangle {
            id: banner
            width: parent.width; height: 50
            gradient: clubcolors
            border {color: "#9EDDF2"; width: 2}
            Text {
                anchors.centerIn: parent
                text: "Club Members"
                font.pixelSize: 32
            }
        }
    }


    PathView {
        id : listViewItem
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 500; height: 500
        focus: true

        path: Path {
            startX: 200; startY: 100
            PathQuad { x: 500; y: 700; controlX: 200; controlY: 400 }
            /*
            PathArc {
                x:200; y:100
                radiusX: 250; radiusY: 150
            }
            PathArc {
                x:600; y:700
                radiusX: 250; radiusY: 150
            }
            */
        }

        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()

        model: NameModel {}
        delegate: contactDelegate
    }
    Gradient {
        id: clubcolors
        GradientStop { position: 0.0; color: "#8EE2FE"}
        GradientStop { position: 0.66; color: "#7ED2EE"}
    }

}

