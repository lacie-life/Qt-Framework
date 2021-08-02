import QtQuick 2.0

Item {
    id: element
    property color offColor: "red"
    property color onColor: "green"
    property color defaultColor: "gray"

    Rectangle {
        id: rectangle
        color: defaultColor
        anchors.fill: parent
        radius: width
    }
    states: [
        State {
            name: "on"

            PropertyChanges {
                target: rectangle
                color: onColor
            }
        },
        State {
            name: "off"

            PropertyChanges {
                target: rectangle
                color: offColor
            }
        }

    ]


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:200;anchors_width:200;anchors_x:215;anchors_y:135}
}
##^##*/
