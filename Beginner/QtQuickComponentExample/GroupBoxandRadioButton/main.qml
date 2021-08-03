import QtQuick 2.12
import QtQuick.Window 2.12

//GroupBox RadioButton and Javascript
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string strDrink: ""
    property string strFood: ""

    Popup {
        id: popup
        anchors.centerIn: parent
        width: 200
        height: 150
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Column {
            anchors.fill: parent
            spacing: 25
             Label {
                 id: lblDetails
                 text: strFood + " with " + strDrink
             }

             Button {
                 id: closeButton
                 text: "Close"
                 onClicked: popup.close()

             }
        }
    }


    Row {
        id: row
        width: 432
        height: 196
        spacing: 25
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        GroupBox {
            id: groupBox
            width: 200
            height: 190
            title: qsTr("Food")

            Column {
                id: colFood
                spacing: 5
                anchors.fill: parent

                RadioButton {
                    id: rdoFish
                    text: qsTr("Fish")
                }

                RadioButton {
                    id: rdoSteak
                    text: qsTr("Steak")
                }

                RadioButton {
                    id: rdoVegan
                    text: qsTr("Vegan")
                }
            }
        }

        GroupBox {
            id: groupBox1
            width: 200
            height: 190
            Column {
                id: colDrink
                spacing: 5
                RadioButton {
                    id: rdoWater
                    text: qsTr("Water")
                }

                RadioButton {
                    id: rdoWine
                    text: qsTr("Wine")
                }

                RadioButton {
                    id: rdoSoda
                    text: qsTr("Soda")
                }
                anchors.fill: parent
            }
            title: qsTr("Drinks")
        }
    }

    Button {
        id: button
        x: 270
        y: 367
        text: qsTr("Click Me")
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Connections {
        target: button
        onClicked: {
            //get the food
            for(var i = 0; i < colFood.children.length; i++) {
                var rdo = colFood.children[i]
                if(rdo.checked) strFood = rdo.text
            }

            for(var i = 0; i < colDrink.children.length; i++) {
                var rdo = colDrink.children[i]
                if(rdo.checked) strDrink = rdo.text
            }

            popup.open()
        }
    }


}


/*##^##
Designer {
    D{i:3;anchors_height:400;anchors_width:200}D{i:8;anchors_height:400;anchors_width:200}
}
##^##*/
