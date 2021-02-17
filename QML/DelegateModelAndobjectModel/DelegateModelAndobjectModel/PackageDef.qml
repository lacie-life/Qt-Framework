import QtQuick 2.0
import "qrc:/"

Package {
    Text {
        id: listDelegate;
        width: parent.width;
        height: 25;
        text: 'Empty';
        Package.name: 'list'
    }
    Text {
        id: gridDelegate;
        width: parent.width / 2;
        height: 50;
        text: 'Empty';
        Package.name: 'grid'
    }

    Rectangle {
        id: wrapper
        width: parent.width;
        height: 25
        color: 'blue'

        Text {
            text: name ;
            anchors.centerIn: parent
        }
       // state: root.isList? 'inList' : 'inGrid'   // uncomment for button control
        state: root.upTo > index ? 'inGrid' : 'inList'
        states: [
            State {
                name: 'inList'
                ParentChange { target: wrapper; parent: listDelegate }
            },
            State {
                name: 'inGrid'
                ParentChange {
                    target: wrapper; parent: gridDelegate
                    x: 0; y: 0; width: gridDelegate.width; height: gridDelegate.height
                }
            }
        ]

        transitions: [
            Transition {
                ParentAnimation {
                    NumberAnimation { properties: 'x,y,width,height'; duration: 600 }
                }
            }
        ]
    }
}

