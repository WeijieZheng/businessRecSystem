/**
 * Created by XZJ on 2014/12/7.
 */
var map = new BMap.Map("baidu-map");
map.centerAndZoom(new BMap.Point(120.158434,30.258995), 15);
map.enableScrollWheelZoom(true);
// 编写自定义函数,创建标注
function addMarker(point,label){
    var marker = new BMap.Marker(point);
    /*
    marker.setLabel(label);
    */
    map.addOverlay(marker);
}
function deleteAllPoints(){
    var allOverlay = map.getOverlays();
    for (var i = 0; i < allOverlay.length -1; i++){
        map.removeOverlay(allOverlay[i]);
    }
}
