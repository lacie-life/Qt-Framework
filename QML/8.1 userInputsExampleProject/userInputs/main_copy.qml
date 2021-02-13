import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow

    visible: true
    title: "Basic layouts"
    property int margin: 11
    width: 500
    height:500
    minimumWidth: mainLayout.Layout.minimumWidth + 2 * margin
    minimumHeight: mainLayout.Layout.minimumHeight + 2 * margin

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Open..." }
            MenuItem { text: "Close" }
        }
    }

    ColumnLayout {
        id: mainLayout
        width: parent.width
        Layout.alignment: Qt.AlignHCenter
        spacing: 0

        TextField {
            id: singleline
            text: "Initial Text"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.margins: 5
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 40
                border.color: singleline.focus ? "#21be2b" : "lightgray"
                color: singleline.focus ? "lightgray" : "transparent"
            }
            onEditingFinished: {
                rectText.text = text
            }
        }
        TextArea {
            id: multiline
            placeholderText: "Initial text\n...\n...\n"
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 5
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 100
                border.color: multiline.focus ? "#21be2b" : "lightgray"
                color: multiline.focus ? "lightgray" : "transparent"
            }
        }
        Rectangle {
            color: "#272822"
            width: 300
            height: 20
        }

        Item {

            Rectangle {
                id: rectangle
                x: 40
                y: 20
                width: 120
                height: 120
                color: "red"

                Text {
                    anchors.fill:parent
                    id: rectText
                    font.family: "Helvetica"
                    color: "blue"
                    font.pointSize: 10
                    wrapMode: Text.WordWrap

                }

                focus: true
                Keys.onUpPressed: rectangle.y -= 10
                Keys.onDownPressed: rectangle.y += 10
                Keys.onLeftPressed: rectangle.x -= 10
                Keys.onRightPressed: rectangle.x += 10

                MouseArea{
                    id: rectMouseArea
                    anchors.fill:parent
                    onClicked: {
                        rectangle.forceActiveFocus();

                    }
                }

                TapHandler {
                    onTapped:{
                        rectangle.height += 10
                        rectangle.width += 10
                    }
                }
            }
        }

    }
}
