import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Tabs")

    property string name: ""

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        // Editor
        Page1Form {
            id: page1
            Component.onCompleted: {
                name = root.name
            }
        }

        // Display
        Page2Form {
            id: page2
        }

        onCurrentIndexChanged: {
            console.log((currentIndex))
            if(currentIndex === 1){
                root.name = page1.name
                page2.name = root.name
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
