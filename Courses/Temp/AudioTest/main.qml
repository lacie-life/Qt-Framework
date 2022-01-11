import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

Window{
    visible: true
    width: 320
    height: 240
    title: qsTr("Play Sound")

    Text {
        id: text
        text: qsTr("Click Me !")
        font.pointSize: 24
        width: 150
        height: 150

        SoundEffect{
            id: playSound
            source: "qrc:/audio/file_example.wav"
        }

        MouseArea{
            id: playArea
            anchors.fill: parent
            onPressed: {
                playSound.play()
            }
        }
    }
}



