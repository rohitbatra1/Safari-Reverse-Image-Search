
function setup(){
    document.addEventListener("contextmenu", handleContextMenu, false);
    safari.self.addEventListener("message", handleMessage);
}

function handleContextMenu(event) {
    console.log("handleContextMenu", event);
    
//    extract image data then send to ExensionHandler
    var image = {};
    
    if (event.target){
        image = getImage(event.target);
    }
    
    safari.extension.setContextMenuEventUserInfo(event, image);
}

function getImage(node){
    
}

function handleMessage(event) {
    console.log(event.name);
    console.log(event.message);
}

document.addEventListener("DOMContentLoaded", function(event) {
//    safari.extension.dispatchMessage("Hello World!");
    setup()
});
