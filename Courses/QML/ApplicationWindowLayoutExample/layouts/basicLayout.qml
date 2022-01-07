import QtQuick 2.2
import QtQuick.Controls 1.2
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
       // anchors.fill: parent
       // anchors.margins: appWindow.margin  //parent.margin
        Layout.alignment: Qt.AlignHCenter

        spacing: 10

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            width: 100
            height: 100
            color: "red"
            border.color: "black"
            border.width: 5
            radius: 10
        }
        Rectangle {
            Layout.alignment: parent
            width: 100
            height: 100
            color: "green"
            border.color: "black"
            border.width: 5
            radius: 20
        }

        Rectangle {
            y: 100; width: 80; height: 80
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightsteelblue" }
                GradientStop { position: 1.0; color: "blue" }
            }
        }
        Rectangle {
            Layout.alignment: Qt.AlignRight
            width: 100
            height: 100
            color: "yellow"
            border.color: "black"
            border.width: 5
            radius: 20
        }

    }
}
