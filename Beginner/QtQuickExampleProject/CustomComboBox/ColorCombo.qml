import QtQuick 2.0
import QtQuick.Controls 2.12

//Owner draw a Component
//https://doc.qt.io/qt-5/qtquickcontrols2-customize.html

ComboBox {
    id: root

    model: ["red", "green", "blue", "yellow", "orange"]

    delegate: ItemDelegate{
        width: root.width
        highlighted: highlightedIndex === index

        contentItem: Row{
            spacing: 5
            width: root.width

            // Draw the color rectange
            Rectangle{
                anchors.verticalCenter: parent.verticalCenter
                width: 10
                height: 10
                border.color: "black"
                border.width: 1
                color: modelData
            }

            // Add the text
            Text {
                id: name
                text: modelData
                color: "black"
                elide: Text.ElideRight
                verticalAlignment: Text.AlignHCenter
            }
        }

        background: Rectangle{
            width: root.width
            implicitHeight: 40
            implicitWidth: 100
            border.color: currentIndex === index ? "green" : "white"
            color: currentIndex === index ? "lightgreen" : "white"
        }
    }

}
