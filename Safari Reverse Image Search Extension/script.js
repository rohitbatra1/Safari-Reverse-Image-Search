
function setup(){
    document.addEventListener("contextmenu", handleContextMenu, false);
    safari.self.addEventListener("message", handleMessage);
}

function handleContextMenu(event) {
    console.log("handleContextMenu", event);
    
//    extract image URL
    var image = {};
    if (event.target){
        image = getImageURL(event.target);
    }
    
    //send image URL to extensionHandler
    safari.extension.setContextMenuEventUserInfo(event, image);
}

function getImageURL(node){
    
}

function handleMessage(event) {
    console.log(event.name);
    console.log(event.message);
}

document.addEventListener("DOMContentLoaded", function(event) {
//    safari.extension.dispatchMessage("Hello World!");
    setup()
});
