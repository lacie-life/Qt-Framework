import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import "qrc:/"
import Qt.instance.infoSingleton 1.0

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
                text:"Page1"
                onClicked: {
                    pageLoader.source = "Page1.qml"
                }
            }

        }

        Item {
            anchors.left:indexcolumn.right
            width: 500; height: 800

            Loader {
                id: pageLoader

                width: 500
                height: 500
                focus: true
            }
            Row {
                anchors.top: pageLoader.bottom
                    Button{
                    id:bluebt
                    width: 100
                    height: 50
                    text:"blue"
                    onClicked: {
                        MyApi.pColor = "blue"
                        refreshLoader()
                    }
                }
                Button{
                    id:yelowbt
                    width: 100
                    height: 50
                    text:"Yellow"
                    onClicked: {
                        MyApi.pColor = "Yellow"
                        refreshLoader()
                    }
                }
                Button{
                    id:pagein
                    width: 100
                    height: 50
                    text:"Increase"
                    onClicked: {
                       MyApi.pFont = MyApi.pFont + 10
                        refreshLoader()
                    }
                }
                Button{
                    id:pagde
                    width: 100
                    height: 50
                    text:"decrease"
                    onClicked: {
                        MyApi.pFont = MyApi.pFont - 10
                        refreshLoader()
                    }
                }
            }
        }
    }
    function refreshLoader()
    {
        var temp = pageLoader.source;
        pageLoader.source= ""
        pageLoader.source = temp
    }
}
