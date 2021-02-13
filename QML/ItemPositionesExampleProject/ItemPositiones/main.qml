import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow

    visible: true
    title: "Basic layouts"
    property int margin: 11
    width: 800
    height:800
    minimumWidth: mainItem.Layout.minimumWidth + 2 * margin
    minimumHeight: mainItem.Layout.minimumHeight + 2 * margin

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Open..." }
            MenuItem { text: "Close" }
        }
    }
    Item {
        id:mainItem
        width: 700
        height: 700
        Grid {    //Flow, Grid, Row
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5
            columns: 4
            rows: 5
           // width: 220
            horizontalItemAlignment: Grid.AlignLeft
            verticalItemAlignment: Grid.AlignTop
            flow: Grid.LeftToRight
            move: Transition {
                    NumberAnimation { properties: "x,y"; duration: 1000 }
                }

            focus: true
            Keys.onSpacePressed: goldrect.visible = !goldrect.visible
            Rectangle {
                color: "lightblue";
                radius: 10.0
                width: 50;
                height: 50;
                //y: 500  // no effect on Positioner items
                visible: true
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "A" + parent.Positioner.index
                }
            }

            Rectangle {
                id: goldrect
                color: "gold";
                radius: 10.0
                width: 70;
                height: 50
                visible: true
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "B" + parent.Positioner.index
                }
            }

            Rectangle {
                color: "red";
                radius: 10.0
                width: 50;
                height: 50
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "C" + parent.Positioner.index
                }
            }

            Rectangle {
                color: "lightgreen";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "D" + parent.Positioner.index
                }
            }

            Rectangle {
                color: "green";
                radius: 10.0
                width: 50;
                height: 70
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "E" + parent.Positioner.index
                }
            }

            Rectangle {
                color: "silver";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "F" + parent.Positioner.index
                }
            }
            Rectangle {
                color: "yellow";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "G" + parent.Positioner.index
                }
            }
            Rectangle {
                color: "orange";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "H" + parent.Positioner.index
                }
            }
            Rectangle {
                color: "black";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "I" + parent.Positioner.index
                }
            }
        }
    }

}
