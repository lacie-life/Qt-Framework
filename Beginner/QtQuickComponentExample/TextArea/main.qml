import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        id: column
        anchors.fill: parent
        spacing: 5

        ScrollView {
            id: scrollView
            width: parent.width
            height: parent.height - (textField.height + 10)

            TextArea {
                id: textArea
                width: parent.width
                text: ""

            }
        }

        TextField {
            id: textField
            focus: true
            text: ""
            width: parent.width

            Keys.onReturnPressed: {
                textArea.append(textField.text)
                textField.clear()
                scrollView.contentItem.contentY = textArea.height - scrollView.contentItem.height
            }
        }


    }

}



