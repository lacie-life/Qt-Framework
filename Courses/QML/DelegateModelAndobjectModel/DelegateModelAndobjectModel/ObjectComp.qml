import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQml.Models 2.1
import QtQuick.Controls 2.12

Item {
    Rectangle {
        ObjectModel {
            id: itemModel
            Rectangle { height: 50; width: 200; color: "red" }
            Rectangle { height: 50; width: 200; color: "green" }
            Rectangle { height: 50; width: 200; color: "blue" }
            Text {height: 50; width: 200; text:"this is Object model comp"; color:"red"}
        }
    }

    ListView {
        id:listViewItem
        width: 500
        height: 500
        anchors.centerIn: parent
        model: itemModel
    }
}
