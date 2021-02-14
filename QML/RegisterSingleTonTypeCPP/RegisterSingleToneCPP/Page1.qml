import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import Qt.example.singletone 1.0 as ImportApi
import Qt.example.singletoneInfo 1.0 as ImportInfoApi

Item {
    id: page2
    anchors.left: parent.left
    Column {
        Text{
            text: "Page1"
            font.pointSize: ImportInfoApi.InfoApi.pFont
        }
        Text {
            text: "State count: " + ImportApi.MyApi.exampleProperty
            font.pointSize: ImportInfoApi.InfoApi.pFont
            color: ImportInfoApi.InfoApi.pColor
        }
        Text {
            text: "Name: " + ImportInfoApi.InfoApi.pName
            font.pointSize: ImportInfoApi.InfoApi.pFont
            color: ImportInfoApi.InfoApi.pColor
        }
        Text {
            text: "Date: " + ImportInfoApi.InfoApi.pDateTime
            font.pointSize: ImportInfoApi.InfoApi.pFont
            color: ImportInfoApi.InfoApi.pColor
        }
        Text {
            text: "font values: " + ImportInfoApi.InfoApi.pFont
            font.pointSize: ImportInfoApi.InfoApi.pFont
            color: ImportInfoApi.InfoApi.pColor

        }
        Text {
            text: "State count: " + ImportInfoApi.InfoApi.pDateTime
            font.pointSize: ImportInfoApi.InfoApi.pFont
            color: ImportInfoApi.InfoApi.pColor
        }



    }
}
