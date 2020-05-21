//add necessary event listeners.
function setup(){
    document.addEventListener("contextmenu", handleContextMenu, false);
    safari.self.addEventListener("message", handleMessage);
}

function handleContextMenu(event) {
    console.log("handleContextMenu", event);
    
//    extract image data
    var imageData = {};
    if (event.target){
        imageData = getImageURL(event.target);
    }

//    send image URL to extensionHandler
    safari.extension.setContextMenuEventUserInfo(event, imageData);
}

function getImageURL(node){
    var data = {};
    
//    get image data
    data['isImage'] = event.target.nodeName;
    data['url'] = event.target.src;
    
    return data;
}

function handleMessage(event) {
    console.log(event.name);
    console.log(event.message);
}

document.addEventListener("DOMContentLoaded", function(event) {
//    setup once web page has loaded.
    setup()
});
