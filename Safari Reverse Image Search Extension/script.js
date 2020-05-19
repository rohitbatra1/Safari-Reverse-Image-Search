
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
    var data = {};
    data['url'] = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/560px-PNG_transparency_demonstration_1.png";
    return data;
}

function handleMessage(event) {
    console.log(event.name);
    console.log(event.message);
}

document.addEventListener("DOMContentLoaded", function(event) {
//    safari.extension.dispatchMessage("Hello World!");
    setup()
});
