import QtQuick 2.0

Rectangle {
    id: page
    width: 360
    height: 360
    color: "#343434"

    Image {
        id: icon
        x: 10
        y: 20
        source: "earth.png"
    }

    Rectangle {
        id: topLeftRect
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.color: "#808080"

        MouseArea {
            anchors.fill: parent
            onClicked: page.state = ''
        }
    }

    Rectangle {
        id: middleRightRect
        x: 6
        y: -6
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#808080"
        MouseArea {
            anchors.fill: parent
            onClicked: page.state = 'State1'
        }
    }

    Rectangle {
        id: bottomLeftRect
        x: 4
        y: 0
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        border.color: "#808080"
        anchors.left: parent.left
        anchors.leftMargin: 10
        MouseArea {
            anchors.fill: parent
            onClicked: page.state = 'State2'
        }
    }
}
