import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import Qt.instance.infoSingleton 1.0

Item {
    id: page2
    anchors.left: parent.left
    Column {
        Text{
            text: "Page2"
            font.pointSize: MyApi.pFont
        }

        Text {
            text: "Name: " + MyApi.name
            font.pointSize: MyApi.pFont
            color: MyApi.pColor
        }

        Text {
            text: "font values: " + MyApi.pFont
            font.pointSize: MyApi.pFont
            color: MyApi.pColor

        }
        Text {
            text: "Change Name"
            font.pointSize: MyApi.pFont
            color: MyApi.pColor
        }

        TextField {
            id: changeId
            width: 300
            text: "Enter text"
            font.pointSize: MyApi.pFont
            onEditingFinished: {
                MyApi.name = text;
            }

        }
        Button {
            id: resetId
            text: "reset"
            onClicked: {
                MyApi.reset()
            }
        }



    }
}
