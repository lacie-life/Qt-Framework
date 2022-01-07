import QtQuick 2.0
import QtQml.Models 2.2
import QtQuick.Controls 2.12


import "qrc:/"

Rectangle {
    id: root
    color: "white"
    width: 320
    height: 480
    property int upTo: 0
    property  bool isList:false
    SequentialAnimation on upTo {
        loops: 1
        NumberAnimation { to: 4; duration: 3500 }
        NumberAnimation { to: 0; duration: 3500 }
    }


    DelegateModel {
        id: visualModel
        delegate: PackageDef {}
        model: SimpleList {}
    }

    ListView {
        id: lv
        height: parent.height/2
        width: parent.width

        model: visualModel.parts.list
    }
    GridView {
        y: parent.height/2
        height: parent.height/2
        width: parent.width
        cellWidth: width / 2
        cellHeight: 50
        model: visualModel.parts.grid
    }
    Button {
        anchors.bottom: parent.bottom
        text: "toggle models"
        onClicked: {
            isList = !isList;
        }
    }
}
