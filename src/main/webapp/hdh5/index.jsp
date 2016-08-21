<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/";
String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
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
    <title>活动</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/zepto.min.js"></script>
    <script src="js/swipe.js"></script>
</head>
<body>
<div class="wrapper index-wrapper">
    <div class="container ">
        <section>
            <div class="loop-wrapper" id="loop_wrapper">
                <ul class="loop-list">
                </ul>
                <ul class="dot nav" id="dot_nav">
                   
                </ul>
                <i id="active"></i>
            </div>
        </section>
        <section id="content">
            
        </section>
    </div>
</div>
<script type="text/javascript">
	var serverUrl='<%=basePath%>';
	var path ='<%=path%>';
	var userid ='<%=userid%>';
	$.getJSON(serverUrl+'/f/activityApi/queryActivityList', { }, function(data){
	  if(data.data&&data.code==200){
		  var arr = data.data;
		  for(var i=0;i<arr.length;i++){
			  var id = arr[i].id;
			  var title = arr[i].title;
			  var desc = arr[i].desc;
			  var content = arr[i].content;
			  var creatdata = arr[i].creatdata;
			  var image = arr[i].image;
			  var imageSrc = arr[i].imageSrc;
			  var im = path+imageSrc;
			  var href = serverUrl+"/hdh5/detail.jsp?aid="+id+"&userid="+userid;
			  $("#content").append('<div class="group" onclick="tourl(\''+href+'\')"><div class="header">'+title+'<span class="data">'+creatdata+'</span></div><div class="content"><div class="banner"><img src="'+im+'"></div><div class="paragraph">'+desc+'</div></div></div>');
		  }
	  }
	});
	
	
	function tourl(url){
		window.location.href=url;
	}
	
    $.getJSON(serverUrl+'/f/mainApi/hdscrollImages', { }, function(data){
		  if(data.data&&data.code==200){
			  var arr = data.data;
			  for(var i=0;i<arr.length;i++){
				  var title = arr[i].title;
				  var href = arr[i].href;
				  var creatdata = arr[i].creatdata;
				  var image = arr[i].image;
				  var im = path+image;
				  $(".loop-list").append('<li><img src="'+im+'" onclick="tourl(\''+href+'\')"></li>');
				  if(i==0){
					  $("#dot_nav").append('<li class="active"></li>');
				  }else{
					  $("#dot_nav").append('<li class=""></li>');
				  }
			  }
			  var mySwipe = Swipe(document.getElementById('loop_wrapper'), {
			        startSlide: 0,
			        auto: 3000,
			        continuous: true,
			        touchend: function (index, element) {
			        },
			        transitionEnd: function (index, element) {
			            $('.nav li').removeClass('active').eq(index).addClass('active');
			        }
			    });
			    $('.loop-list li').css('display', 'block');
		  }
		});
</script>
</body>
</html>