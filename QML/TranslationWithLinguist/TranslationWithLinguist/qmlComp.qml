import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    id:itemComp
    property int stateNumber:5

    signal qmlSignal(msg: string)

    width: 1000; height: 800
    anchors.centerIn: parent
    Rectangle {
        id: rectId
        objectName: "rect"
        anchors.fill: parent
        anchors.centerIn: parent
        color: "red"
        Column {
            anchors.fill: parent
            spacing: 10
            Text {
                id: lebetitle
                font.pointSize: 20
                color:"blue"
                text: qsTr("This is test app for translations")
            }
            Text {
                id: lebetitle1
                font.pointSize: 20
                color:"blue"
                text: qsTr("This is example")
            }
            Row {
                spacing: 10
                Text {
                    id: lebel1
                    font.pointSize: 20
                    color:"blue"
                    text: qsTr("Name of the student: ")
                }
                TextInput {
                    id: inputField
                    font.pointSize: 20
                    color: "green"
                    text: qsTr("Enter Name")
                }
            }
            Text {
                id: rectText
                objectName: "rectTextObj"
                text:qsTr("Hello world")
                font.pointSize: 20
            }
            Row {
                spacing: 10
                Text {
                    id: msgL
                    font.pointSize: 20
                    color:"blue"
                    text: qsTr("Current Message: %L1 :").arg(myClass.count)
                }
                Text {
                    id: msgT
                    font.pointSize: 20
                    color:"blue"
                    text: myClass.message
                }
            }

            Button{
                id: bHindi
                text: "Hindi"
                onClicked:{
                    qmlSignal("Hindi")
                }

            }
            Button{
                id: bFrench
                text: "French"
                onClicked:{
                    qmlSignal("French")
                }

            }
            Button{
                id: bSp
                text: "Spanish"
                onClicked:{
                    qmlSignal("Spanish")
                }

            }
            Button{
                id: bEn
                text: "English"
                onClicked:{
                    qmlSignal("English")
                }

            }
        }

    }

    function myQmlFunction(msg: string) : string {
        console.log("Got message:", msg)
        rectText.text = msg
        return "success"
    }
    }
