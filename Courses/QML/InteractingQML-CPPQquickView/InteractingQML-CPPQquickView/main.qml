import QtQuick 2.0

Item {
    id: itemComp
    property int stateNumber:5
    property int refWidth:0

    signal qmlSignal(msg: string)


    width: 100;
    height: width
    anchors.leftMargin: 50
    anchors.topMargin: 50
    Rectangle {
        id: rectId
        objectName: "rect"
        anchors.fill: parent
        anchors.centerIn: parent
        color: "red"
        width: refWidth
        Text {
            id: rectText
            objectName: "rextTextObj"
            text:"Hello world"
            font.pointSize: 40
        }
        MouseArea {
            anchors.fill: parent
            onClicked: itemComp.qmlSignal("Hello from QML")
        }
    }

    function myQmlFunction(msg: string) : string {
            console.log("Got message:", msg)
            rectText.text = msg
            return "success"
        }
}
