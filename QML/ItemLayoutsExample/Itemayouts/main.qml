import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow

    visible: true
    title: "Basic layouts"
    property int margin: 11
    width: 1000
    height:1000
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
        GridLayout {   //ColumnLayout  GridLayout
            id: layoutItem
            //spacing: 10

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            //spacing: 10
            rows:10
            columns: 5
            //columnSpacing: 10
            //rowSpacing: 10
            flow: Grid.LeftToRight
            layoutDirection: Qt.LeftToRight

            focus: true
            Keys.onSpacePressed: goldrect.visible = !goldrect.visible
            Rectangle {
                color: "lightblue";
                radius: 10.0
                width: 50;
                height: 50;
                y: 500  // no effect on Positioner items
                visible: true
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "A"
                }
                Layout.alignment: Qt.AlignVCenter; // | Qt.AlignHCenter;
                Layout.rowSpan: 3
                Layout.columnSpan: 3
            }

            Rectangle {
                id: goldrect
                color: "gold";
                radius: 10.0
                width: 20;
                height: 50
                visible: true
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "B"
                }
            }

            Rectangle {
                color: "red";
                radius: 10.0
                width: 50;
                height: 50
                 Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter;
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "C"
                }
            }

            Rectangle {
                color: "lightgreen";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "D"
                }
            }

            Rectangle {
                color: "green";
                radius: 10.0
                width: 150;
                height: 70
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "E"
                }
            }

            Rectangle {
                color: "silver";
                radius: 10.0
                width: 50;
                height: 50
                Text { anchors.centerIn: parent
                    font.pointSize: 10;
                    text: "F"
                }
            }
            Text { text: "test component1 " }
            Text { text: "test component2 " }
            Text { text: "test component3 " }
            Text { text: "test component4 ";  Layout.rowSpan: 3}
            Text { text: "test component5 " }
            Text { text: "test component6 " }
            Text { text: "Total Height of layout  " +layoutItem.height }
        }
        StackLayout {
            id: staclayoutItem
            anchors.top:layoutItem.bottom
            anchors.topMargin: 30
            currentIndex: comboSelect.currentIndex
            Rectangle {
                color: 'teal'
                width: 50
                height: 50
            }
            Rectangle {
                color: 'plum'
                width: 30
                height: 30

            }
            Rectangle {
                color: 'green'
                width: 40
                height: 40

            }
            Rectangle {
                color: 'red'
                width: 20
                height: 20
                implicitWidth: 50
                implicitHeight: 20
            }
        }
        ComboBox{
            id: comboSelect

            anchors.topMargin: 30
            anchors.top:staclayoutItem.bottom
            currentIndex: 2
                model: ListModel {
                    id: cbItems
                    ListElement { text: "1";  }
                    ListElement { text: "2"; }
                    ListElement { text: "3"; }
                    ListElement { text: "4"; }
                }
                width: 200
        }
    }

}

