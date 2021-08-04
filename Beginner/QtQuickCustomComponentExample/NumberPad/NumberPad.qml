import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    id: root
    signal clicked(int value)

    Column{
        id: col
        Grid{
            id: grid
            spacing: 5
            rows: 4
            columns: 3
        }
    }

        function doClicked(value){
            console.log(value)
            clicked(value)
        }

        Component.onCompleted: {
            console.log("Createing Button")
            var num = 0
            for(var i = 0; i < 10; i++){

                if(i === 0) num = 7; //First Row
                if(i === 3) num = 4; //Second Row
                if(i === 6) num = 1; //Third Row
                if(i === 9) num = 0; //Bottom Row

                var btn = Qt.createQmlObject('import QtQuick 2.0; import QtQuick.Controls 2.12; Button {id: btn' + i +'; onClicked:doClicked('+ num +') }',grid,"DynamicallyLoaded")

                btn.text = num
                btn.width = 40
                btn.height = 40
                num++
            }

            // Set the last button
            var obj = grid.children[grid.children.length - 1]
            obj.parent = col
            obj.width = (40 * grid.columns) + 10
        }
}
