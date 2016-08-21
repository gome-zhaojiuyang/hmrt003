<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/";
String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String aid = request.getParameter("aid");
String userid = request.getParameter("userid");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta id="viewport" name="viewport"
          content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>活动详情</title>
    <!--<script>!function (n) {-->
        <!--var e = n.document, t = e.documentElement, i = 720, d = i / 100, o = "orientationchange"in n ? "orientationchange" : "resize", a = function () {-->
            <!--var n = t.clientWidth || 320;-->
            <!--n > 720 && (n = 720), t.style.fontSize = n / d + "px"-->
        <!--};-->
        <!--e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))-->
    <!--}(window);</script>-->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/zepto.min.js"></script>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <div class="header">
            
        </div>
        <div class="content">
            <!-- <div class="banner">
                <img src="img/banner.jpg">
            </div> -->
            <div class="paragraph">
            
            </div>
            <div class="operator clear">
                <span class="likes"></span>
            </div>
            <div class="comment">
                <ul class="comment-list">
                    
                </ul>
            </div>
        </div>
        <div class="ipt-box clear">
            <div class="ipt-txt">
                <input type="text" class="ipt"  placeholder="请输入评论内容">
            </div>
            <span class="ipt-btn" onclick="submitComment();">发送</span>
        </div>
    </div>
</div>
<script type="text/javascript">
	var serverUrl='<%=basePath%>';
	var path ='<%=path%>';
	var id ='<%=aid%>';
	var userid='<%=userid%>'
	$.getJSON(serverUrl+'/f/activityApi/queryActivityById?id='+id, { }, function(data){
	  if(data.data&&data.code==200){
		  var arr = data.data;
			  var id = arr.id;
			  var title = arr.title;
			  var desc = arr.desc;
			  var content = arr.content;
			  var creatdata = arr.creatdata;
			  var image = arr.image;
			  var imageSrc = arr.imageSrc;
			  var im = path+imageSrc;
			  $(".header").append(title+'<span class="data">'+creatdata+'</span>');
			  $(".paragraph").append(content);
	  }
	});
	
	$.getJSON(serverUrl+'/f/activityApi/queryCommentList?articleid='+id, { }, function(data){
		  if(data.data&&data.code==200){
			  var arr = data.data;
			  var size = arr.length;
			  for(var i=0;i<arr.length;i++){
				  var userName = arr[i].userName;
				  if(userName == undefined){
					  userName="匿名";
				  }
				  var content = arr[i].content;
				  $(".comment-list").append('<li><span class="nickname">'+userName+'：</span><span class="discuss">'+content+'</span></li>');
			  }
			  $(".likes").append(size);
		  }
		});

	function submitComment(){
		var comment=$(".ipt").val();
			$.getJSON(serverUrl+'/f/activityApi/saveComment?articleid='+id+"&userid="+userid+"&content="+comment, { }, function(data){
				  if(data.code==200){
					  alert("评论成功");
					  $(".comment-list").empty();
					  $.getJSON(serverUrl+'/f/activityApi/queryCommentList?articleid='+id, { }, function(data){
						  if(data.data&&data.code==200){
							  var arr = data.data;
							  var size = arr.length;
							  for(var i=0;i<arr.length;i++){
								  var userName = arr[i].userName;
								  if(userName == undefined){
									  userName="匿名";
								  }
								  var content = arr[i].content;
								  $(".comment-list").append('<li><span class="nickname">'+userName+'：</span><span class="discuss">'+content+'</span></li>');
							  }
							  $(".likes").empty();
							  $(".likes").append(size);
						  }
						});
				  }
				});
	}
</script>
</body>
</html>