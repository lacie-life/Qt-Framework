import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow

    visible: true
    title: "Anchors"
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

        Rectangle {
            id: blueRect
            anchors.centerIn:parent

            color: "blue";
            radius: 10.0
            width: 100;
            height: 100
            visible: true
            Text {
                anchors.centerIn: parent
                font.pointSize: 10;
                text: "A" + parent.Positioner.index
            }
        }
        Rectangle {
            id: goldrect

            anchors.left: parent.left
            color: "gold";
            radius: 10.0
            width: marginSlider.value
            height: 50
            visible: true
            Text {
                anchors.centerIn: parent
                font.pointSize: 10;
                text: "B" + parent.Positioner.index
            }
        }

        Rectangle {
            id:redRect

            anchors.left: goldrect.right
            color: "red";
            radius: 10.0
            width: 150;
            height: marginSlider.value
            Text {
                anchors.centerIn: parent
                font.pointSize: 10;
                text: "C" + parent.Positioner.index
            }
        }

        Button {
            id: buttonMove
            anchors.left: redRect.right
            anchors.top: redRect.bottom
            text: "Change C1"
            onClicked: {
                redRect.anchors.top = goldrect.bottom
            }
        }
        states: [
            State {
                name: "reanchored"

                AnchorChanges {
                    target: goldrect
                    anchors.top: blueRect.bottom
                    anchors.left: blueRect.left
                }
                PropertyChanges {
                    target: goldrect
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                }
            },
            State {
                name: "reset"

                AnchorChanges {
                    target: goldrect
                    anchors.top: mainItem.top
                    anchors.left: mainItem.left
                }
                PropertyChanges {
                    target: goldrect
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                }
            }
        ]
        Transition {
            AnchorAnimation {}
        }

        Button {
            id: stateButton
            anchors.left: mainItem.left
            anchors.bottom: mainItem.bottom
            text: "Change B1"

            onPressed: {
                mainItem.state = "reanchored"
            }

            onReleased: {
                mainItem.state = "reset"
            }

        }
        Slider {
            id: marginSlider

            anchors.left: parent.left
            anchors.bottom: stateButton.top
            from: 1
            value: 50
            stepSize: 1
            to: 200
            //orientation: Qt.Vertical
            onMoved: {
                blueRect.width = marginSlider.value*2
                goldrect.anchors.leftMargin = marginSlider.value * 0.5
            }
        }

    }
}
