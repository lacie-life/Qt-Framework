import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import Qt.example.InfoProvider 1.0 as InfoApi

Item {
    id: page3
    anchors.left: parent.left
    Column {
        Text{
            text: "Page4"
            font.pointSize: InfoApi.InfoProviderAPI.pFont
        }

        Text {
            text: "Name: " + InfoApi.InfoProviderAPI.name
            font.pointSize: InfoApi.InfoProviderAPI.pFont
            color: InfoApi.InfoProviderAPI.pColor
        }
        Text {
            text: "Color: " + InfoApi.InfoProviderAPI.pColor
            font.pointSize: InfoApi.InfoProviderAPI.pFont
            color: InfoApi.InfoProviderAPI.pColor
        }
        Text {
            text: "font values: " +InfoApi.InfoProviderAPI.pFont
            font.pointSize: InfoApi.InfoProviderAPI.pFont
            color: InfoApi.InfoProviderAPI.pColor

        }

    }
}
