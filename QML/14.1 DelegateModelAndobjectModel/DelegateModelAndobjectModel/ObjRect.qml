import QtQuick 2.0
import QtQml.Models 2.2

import "qrc:/"
Rectangle {
    width: 200; height: 100

    DelegateModel {
        id: visualModel
        model: SimpleList {}
        groups: [
            DelegateModelGroup { name: "selected" },
            DelegateModelGroup { name: "hovered" }
        ]

        delegate: Rectangle {
            id: item
            height: 100
            width: 200
            Text {
                text: {
                    var text = "Name: " + name
                    if (item.DelegateModel.inSelected)
                        text += " (" + item.DelegateModel.selectedIndex + ")"
                    if (item.DelegateModel.inHovered)
                         text += " [" + item.DelegateModel.hoveredIndex + "]"
                    return text;
                }
                color: item.DelegateModel.inSelected ? "red" : "black"
                font.pointSize: item.DelegateModel.inHovered? 40:20
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: item.DelegateModel.inSelected = !item.DelegateModel.inSelected
                onHoveredChanged: item.DelegateModel.inHovered = !item.DelegateModel.inHovered
            }
        }
    }

    ListView {
        anchors.fill: parent
        model: visualModel
    }
}
