import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import "qrc:/"

Item {
    Component {
        id: contactDelegate

        Rectangle {
            id: wrapper
            width: imageComp.width
            height: contactInfo.height +  imageComp.height
            color: ListView.isCurrentIndex ? "black" : "red"
            Image {
                id: imageComp
                anchors.left: parent.left
                width: 20
                height: 20
                source: portrait;
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
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

    Component {     //instantiated when header is processed
        id: bannercomponent
        Rectangle {
            id: banner
            width: parent.width;
            height: 50
            gradient: clubcolors
            border {color: "#9EDDF2"; width: 2}
            Text {
                anchors.centerIn: parent
                text: "Club Members"
                font.pixelSize: 32
            }
        }
    }


    ListView {
        id : listViewItem
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 500; height: 500

        focus: true
        flickableDirection: Flickable.AutoFlickDirection

        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()

        model: NameModel {}
        delegate: contactDelegate

        header: bannercomponent
        footer: Rectangle {
            width: parent.width; height: 30;
            gradient: clubcolors
        }
    }
    Gradient {
        id: clubcolors
        GradientStop { position: 0.0; color: "#8EE2FE"}
        GradientStop { position: 0.66; color: "#7ED2EE"}
    }

}

