var Root
var Box

function performClick(root, obj) {
    // Javascript signal handler

    print("Javascriptt in a signal handler")

    var max = Root.width - Box.width
    Box.x = (Box.x === 0) ? max : 0

}

function swapColor(obj){
    return obj.pressed ? "orange" : "gray"
}

function startup(croot, cbox){
    print("Starting!!")

    Root = croot
    Box = cbox
}

function clicked(mouse){
    print("Clicked!!")
    performClick()
}
