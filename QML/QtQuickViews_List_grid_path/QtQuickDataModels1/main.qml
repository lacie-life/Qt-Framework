import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import "qrc:/"

ApplicationWindow {
    id: appWindow

    visible: true
    title: "Views"
    property int margin: 11
    width: 800
    height:900
    minimumWidth: windowBody.Layout.minimumWidth + 2 * margin
    minimumHeight: windowBody.Layout.minimumHeight + 2 * margin

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Open..." }
            MenuItem { text: "Close" }
        }
    }
    Item {
        id:windowBody
        Column {
            id: indexcolumn
            anchors.left: parent.left
            Button{
                id:page1
                width: 100
                height: 50
                text:"List View"
                onClicked: {
                    pageLoader.source = "ListViewItem.qml"
                }
            }
            Button{
                id:page2
                width: 100
                height: 50
                text:"Grid View"
                onClicked: {
                    pageLoader.source = "GridViewItem.qml"
                }
            }
            Button{
                id:page3
                width: 100
                height: 50
                text:"Path View"
                onClicked: {
                    pageLoader.source = "PathViewItem.qml"
                }
            }
        }

        Item {
            anchors.left:indexcolumn.right
            width: 500; height: 800

            Loader {
                id: pageLoader
                focus: true
            }
        }

    }
}
