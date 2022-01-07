import QtQuick 2.0

Item {
    function readValues(anArray, anObject) {
        for (var i=0; i<anArray.length; i++)
            console.log("Array item:", anArray[i])

        for (var prop in anObject) {
            console.log("Object item:", prop, "=", anObject[prop])
        }
    }

    function readDate(dt) {
           console.log("The given date is:", dt.toUTCString());
           return new Date();
       }
}
