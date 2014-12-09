function MainController($scope) {
	$scope.isShowSearchDialog = false;
	/*
	$scope.loadBaiduMap = function () {
		var map = new BMap.Map("baidu-map");
	    map.centerAndZoom(new BMap.Point(117.269945,31.86713), 13);
	    map.enableScrollWheelZoom(true);
	    var index = 0;
	    var myGeo = new BMap.Geocoder();
	}
	 */
	$scope.showSearchDialog = function () {
		if (!$scope.isShowSearchDialog) {
			$scope.isShowSearchDialog = true;
			// $('#container').attr("class", "");
		    $('#sidebar').attr("style", "overflow: hidden; outline: none; margin-top: 40px;");
		    $('#aside').attr("style", "height:130px");
		} else {
			$scope.isShowSearchDialog = false;
			// $('#container').attr("class", "sidebar-closed");
		    $('#sidebar').attr("style", "overflow: hidden; outline: none; margin-top: -220px;");
		    $('#aside').attr("style", "height:0px");
		}
		
	}
}