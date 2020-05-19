
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
    data['url'] = "https://cdn.vox-cdn.com/thumbor/6pFo7mQ501PLVo5Zkwq9NpxPEBM=/0x0:4000x2667/1820x1213/filters:focal(1680x1014:2320x1654)/cdn.vox-cdn.com/uploads/chorus_image/image/66812403/520557826.jpg.0.jpg";
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
