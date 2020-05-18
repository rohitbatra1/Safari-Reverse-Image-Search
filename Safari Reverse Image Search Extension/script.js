
function setup(){
    document.addEventListener("contextmenu", handleContextMenu, false);
    safari.self.addEventListener("message", handleMessage);
}

function handleContextMenu(event) {
    
}

function handleMessage(event) {
    console.log(event.name);
    console.log(event.message);
}

document.addEventListener("DOMContentLoaded", function(event) {
//    safari.extension.dispatchMessage("Hello World!");
    setup()
});
