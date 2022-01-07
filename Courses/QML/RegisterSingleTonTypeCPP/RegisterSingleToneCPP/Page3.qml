import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import Qt.example.InfoProvider 1.0 as InfoAPI

Item {
    id: page3
    anchors.left: parent.left
    Column {
        Text{
            text: "Page3"
            font.pointSize: InfoAPI.InfoProviderAPI.pFont
        }

        Text {
            text: "Name: " + InfoAPI.InfoProviderAPI.name
            font.pointSize: InfoAPI.InfoProviderAPI.pFont
            color: InfoAPI.InfoProviderAPI.pColor
        }
        Text {
            text: "Color: " + InfoAPI.InfoProviderAPI.pColor
            font.pointSize: InfoAPI.InfoProviderAPI.pFont
            color: InfoAPI.InfoProviderAPI.pColor
        }
        Text {
            text: "font values: " +InfoAPI.InfoProviderAPI.pFont
            font.pointSize: InfoAPI.InfoProviderAPI.pFont
            color: InfoAPI.InfoProviderAPI.pColor

        }


    }
}
