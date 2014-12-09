<%--
  Created by IntelliJ IDEA.
  User: XZJ
  Date: 2014/12/9
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app>
<head>
  <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
  <title>基于时空信息的商业推荐系统</title>

  <!--   <link rel="stylesheet" href="http://js.arcgis.com/3.10/js/dojo/dijit/themes/claro/claro.css"/>
    <link rel="stylesheet" href="http://js.arcgis.com/3.10/js/esri/css/esri.css" /> -->
  <link rel="stylesheet" href="stylesheets/style.css" />
  <link rel="stylesheet" href="stylesheets/bootstrap.css" />
  <link rel="stylesheet" href="stylesheets/font-awesome.css"/>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

</head>

<body style="" ng-controller="MainController">

<section id="container" class="">
  <!-- **********************************************************************************************************************************************************
  TOP BAR CONTENT & NOTIFICATIONS
  *********************************************************************************************************************************************************** -->
  <!--header start-->
  <header class="header black-bg">
    <div class="sidebar-toggle-box" ng-click="showSearchDialog()">
      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </div>
    <!--logo start-->
    <a href="main.jsp" class="logo"><b>Rec System</b></a>
    <!--logo end-->
  </header>
  <!--header end-->



  <!-- **********************************************************************************************************************************************************
  MAIN CONTENT
  *********************************************************************************************************************************************************** -->
  <!--main content start-->
  <section id="main-content">
    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside id="aside" style="height:0px">
      <div id="sidebar" class="nav-collapse " style="overflow: hidden; outline: none; margin-top: -220px;" tabindex="5000">
        <!-- sidebar menu start-->
        <!-- <ul class="sidebar-menu" id="nav-accordion" style="margin-left:5px; margin-right:5px"> -->
        <ul class="nav nav-tabs" id="myTab">
          <li role="presentation" class="active"><a href="#al1">AL1</a></li>
          <li role="presentation"><a href="#al2">AL2</a></li>
          <li role="presentation"><a href="#al3">AL3</a></li>
        </ul>
        <!-- </ul> -->
        <div class="tab-content">
          <div class="tab-pane active" id="al1">
            <div id="search" style="margin-top:10px" >
              <form class="navbar-form navbar-left" role="search" style="float:right; margin-left:100px;" action="queryKeyword.action" method="post">
                <div class="form-group">
                  <input type="text"  name="lat" class="form-control" placeholder="latitude" style="margin-right:20px">
                  <input type="text" name="lng" class="form-control" placeholder="longitude" style="margin-right:20px">
                  <input type="text" name="keyword" class="form-control" placeholder="keyword" style="margin-right:20px">
                </div>
                <input id = "queryKeywordButton" type="button" value="Search" class="btn btn-theme" style="margin-left:40px">
              </form>

             <!--
              <form class="navbar-form navbar-left" role="search" style="float:right; margin-left:100px;">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="latitude" style="margin-right:20px">
                <input type="text" class="form-control" placeholder="longitude" style="margin-right:20px">
                <input type="text" class="form-control" placeholder="descript" style="margin-right:20px">
              </div>
              <button type="submit" class="btn btn-theme" style="margin-left:40px">Search</button>
            </form>
            -->
            </div>
          </div>
          <div class="tab-pane" id="al2">...</div>
          <div class="tab-pane" id="al3">...</div>
        </div>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <section class="wrapper">

      <div class="row">
        <!-- <div id="search" style="margin-top:10px" >
          <form class="navbar-form navbar-left" role="search" style="float:right; margin-left:100px;">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="latitude" style="margin-right:20px">
              <input type="text" class="form-control" placeholder="longitude" style="margin-right:20px">
              <input type="text" class="form-control" placeholder="descript" style="margin-right:20px">
            </div>
            <button type="submit" class="btn btn-theme" style="margin-left:40px">Search</button>
          </form>
        </div> -->
        <div class="col-lg-9 main-chart" ng-init="loadBaiduMap()">
          <div id="baidu-map" style="height: 100%; width: 100%">
          </div>

        </div><!-- /col-lg-9 END SECTION MIDDLE -->


        <!-- **********************************************************************************************************************************************************
        RIGHT SIDEBAR CONTENT
        *********************************************************************************************************************************************************** -->

        <div class="col-lg-3 ds">
          <!--COMPLETED ACTIONS DONUTS CHART-->
          <h3>RESULT</h3>

          <!-- First Action -->
          <div class="desc">
            <div class="thumb">
              <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
            </div>
            <div class="details">
              <p><muted>2 Minutes Ago</muted><br>
                <a href="#">James Brown</a> subscribed to your newsletter.<br>
              </p>
            </div>
          </div>
          <!-- Second Action -->
          <div class="desc">
            <div class="thumb">
              <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
            </div>
            <div class="details">
              <p><muted>3 Hours Ago</muted><br>
                <a href="#">Diana Kennedy</a> purchased a year subscription.<br>
              </p>
            </div>
          </div>
          <!-- Third Action -->
          <div class="desc">
            <div class="thumb">
              <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
            </div>
            <div class="details">
              <p><muted>7 Hours Ago</muted><br>
                <a href="#">Brandon Page</a> purchased a year subscription.<br>
              </p>
            </div>
          </div>
          <!-- Fourth Action -->
          <div class="desc">
            <div class="thumb">
              <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
            </div>
            <div class="details">
              <p><muted>11 Hours Ago</muted><br>
                <a href="#">Mark Twain</a> commented your post.<br>
              </p>
            </div>
          </div>
          <!-- Fifth Action -->
          <div class="desc">
            <div class="thumb">
              <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
            </div>
            <div class="details">
              <p><muted>18 Hours Ago</muted><br>
                <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br>
              </p>
            </div>
          </div>

          <!-- USERS ONLINE SECTION -->

        </div><!-- /col-lg-3 -->
      </div><!-- --/row ---->
    </section>
  </section>

  <!--main content end-->
  <!--footer start-->
  <footer class="site-footer">
    <div class="text-center">
      2014 - ZJU brs开发小组
      <a href="index.html#" class="go-top">
        <i class="fa fa-angle-up"></i>
      </a>
    </div>
  </footer>
  <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<!--script src="http://js.arcgis.com/3.10/"></script-->
<script src="javascripts/jquery-2.1.1.min.js"></script>
<script src="http://cdn.bootcss.com/angular.js/1.3.0-beta.8/angular.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=m7opgMGTp9ZGjkbhtvoClfOv"></script>
<script type="text/javascript" src="javascripts/baidumap.js"></script>
<script type="text/javascript" src="javascripts/map.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script>
  $(function () {
    $('#myTab a:first').tab('show');//初始化显示哪个tab

    $('#myTab a').click(function (e) {
      e.preventDefault();//阻止a链接的跳转行为
      $(this).tab('show');//显示当前选中的链接及关联的content
    });

    $(window).scroll(function () {
      console.log($(this));
      $('#sidebar').attr("style", "overflow: hidden; outline: none; margin-top: -220px;");
      $('#aside').attr("style", "height:0px");
    });

  })
</script>
<script type="text/javascript">
  $(function () {
    $("#queryKeywordButton").click(function(){
      var params = {
        keyword:$('input[name="keyword"]').val()
      };
      $.ajax({
        url:'queryKeyword.action',
        type:'POST',
        data:params,
        dataType:'json',
        success:function (data) {
          deleteAllPoints();
          for(var i= 0,len = data.length;i<len ;i++) {
            var obj = data[i];
            var point = new BMap.Point(obj.lng,obj.lat);
            var label = new BMap.Label(obj.shop_name,{offset:new BMap.Size(20,-10)});
            addMarker(point,label);
          }
        }
      });
    });
  });
</script>
</body>
</html>
