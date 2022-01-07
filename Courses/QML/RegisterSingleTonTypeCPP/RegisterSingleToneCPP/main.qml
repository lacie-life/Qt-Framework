import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import "qrc:/"
import Qt.example.singletone 1.0 as ImportApi
import Qt.example.singletoneInfo 1.0 as ImportInfoApi
import Qt.example.InfoProvider 1.0 as InfoAPI


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
            Button{
                id:page2
                width: 100
                height: 50
                text:"Page2"
                onClicked: {
                    pageLoader.source = "Page2.qml"
                }
            }
            Button{
                id:page3
                width: 100
                height: 50
                text:"Page3"
                onClicked: {
                    pageLoader.source = "Page3.qml"
                }
            }
            Button{
                id:page4
                width: 100
                height: 50
                text:"Page4"
                onClicked: {
                    pageLoader.source = "Page4.qml"
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
                        ImportInfoApi.InfoApi.pColor = "blue"
                        InfoAPI.InfoProviderAPI.pColor = "blue"
                        refreshLoader()
                    }
                }
                Button{
                    id:yelowbt
                    width: 100
                    height: 50
                    text:"Yellow"
                    onClicked: {
                        ImportInfoApi.InfoApi.pColor = "Yellow"
                        InfoAPI.InfoProviderAPI.pColor = "Yellow"
                        refreshLoader()
                    }
                }
                Button{
                    id:pagein
                    width: 100
                    height: 50
                    text:"Increase"
                    onClicked: {
                        ImportInfoApi.InfoApi.pFont = ImportInfoApi.InfoApi.pFont + 1
                        InfoAPI.InfoProviderAPI.pFont = InfoAPI.InfoProviderAPI.pFont +1
                        refreshLoader()
                    }
                }
                Button{
                    id:pagde
                    width: 100
                    height: 50
                    text:"decrease"
                    onClicked: {
                        ImportInfoApi.InfoApi.pFont = ImportInfoApi.InfoApi.pFont - 1
                        InfoAPI.InfoProviderAPI.pFont = InfoAPI.InfoProviderAPI.pFont -1
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
