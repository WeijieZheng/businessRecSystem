<%--
  Created by IntelliJ IDEA.
  User: XZJ
  Date: 2014/12/7
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

  <head>
    <title>基于时空信息的商业推荐系统</title>
    <!--
        <link rel="stylesheet" href="./stylesheets/style.css" />
        <link rel="stylesheet" href="./stylesheets/bootstrap.css" />
        <link rel="stylesheet" href="./stylesheets/font-awesome.css" />
    -->

  </head>

      <body style="">

      <section id="container">

        <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">

      <form action="queryLocation.action" method="post">
        输入经纬度:
        纬度：<input type="text" name="lat" size="5" maxlength="20" value=30.258995>
        经度：<input type="text" name="lng" size="5" maxlength="20" value=120.158434>
        <input id = "queryLocationButton" type="button" value="查询经纬度">
      </form>

      <form action="queryKeyword.action" method="post">
        输入关键词信息:
        关键词：<input type="text" name="keyword" size="8" maxlength="20" value="沙县">
        <input id = "queryKeywordButton" type="button" value="查询关键词">
      </form>

      <section class="wrapper">

        <div class="row">
          <div class="col-lg-9 main-chart">
            <div id="baidu-map" style="height: 100%; width: 100%">
            </div>
          </div><!-- /col-lg-9 END SECTION MIDDLE -->
        </div><!-- --/row ---->
      </section>
    </section>
    <!--main content end-->
  </section>

  <!-- js placed at the end of the document so the pages load faster -->

  </body>
  <script type="text/javascript" src="javascripts/jquery-2.1.1.min.js"></script>
  <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=m7opgMGTp9ZGjkbhtvoClfOv"></script>
  <script type="text/javascript" src="javascripts/map.js" ></script>
  <script type="text/javascript">
    $(function () {
      $("#queryLocationButton").click(function () {
        var params = {
          lat:$('input[name="lat"]').val(),
          lng:$('input[name="lng"]').val()
        };
        $.ajax({
          url:'queryLocation.action',
          type:'POST',
          data:params,
          dataType:'json',
          success:function (data) {
              deleteAllPoints();
              for(var i= 0,len = data.length;i<len ;i++) {
                var obj = data[i];
                var point = new BMap.Point(obj.lng,obj.lat);
                addMarker(point);
              }
          }
        });
      });
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


</html>
