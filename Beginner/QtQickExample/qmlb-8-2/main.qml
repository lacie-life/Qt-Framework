import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Label {
        id: label
        x: 58
        y: 35
        text: qsTr("This is a label")
    }

    Label {
        id: label1
        x: 58
        y: 86
        width: 144
        height: 69
        color: "#f90606"
        text: qsTr("This is a loooong lable title - probably the longest")
        font.italic: true
        font.underline: true
        font.bold: true
        wrapMode: Text.WordWrap
    }

    Label {
        id: label2
        x: 58
        y: 177
        text: qsTr("This is <font color='blue'><b>H<i>T</i>ML</b>!!!</font>")
        font.pointSize: 45
    }


}
