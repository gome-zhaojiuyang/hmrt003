<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css">
    <script src="${ctxStatic}/js/zepto.min.js"></script>
    <script src="${ctxStatic}/js/swipe.js"></script>
	
</head>
<body>
	<div class="row">
	  <%--  <div class="span2">
	   	 <h4>栏目列表</h4>
		 <ol>
		 	<cms:frontCategoryList categoryList="${categoryList}"/>
		 </ol>
		 <h4>推荐阅读</h4>
		 <ol>
		 	<cms:frontArticleHitsTop category="${category}"/>
		 </ol>
	   </div> --%>
	  <%--  <div class="span10">
		 <ul class="breadcrumb">
		    <cms:frontCurrentPosition category="${category}"/>
		 </ul>
	   </div> --%>
	    
  	  
  	  
	   <div class="container ">
	   		 <c:if test="${category.module eq 'article'}">
			<c:forEach items="${page.list}" var="article">
				 <div class="group clear">
                <div class="item ">
                    <div class="item-left">
                        <img src="http://120.26.241.215:8181/${article.image}" width="100px" heiht="100px">
                    </div>
                    <div class="item-right">
                        <p class="item-title"><a href="${article.url}" style="color:${article.color}" title="${article.title }">${fns:abbr(article.title,18)}</a></p>
                        <p class="item-desc">${fns:abbr(article.articleData.content,200)}</p>
                    </div>
                </div>
            </div>
				<%-- <li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,96)}</a></li> --%>
			</c:forEach>
			<div class="pagination">${page}</div>
			<script type="text/javascript">
				function page(n,s){
					location="${ctx}/list-${category.id}${urlSuffix}?pageNo="+n+"&pageSize="+s;
				}
			</script>		
		  	</c:if>
    </div>
	   
      <%--  <div class="span10">
		  <h4>${category.name}</h4>
		  <c:if test="${category.module eq 'article'}">
			<ul><c:forEach items="${page.list}" var="article">
				<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,96)}</a></li>
			</c:forEach></ul>
			<div class="pagination">${page}</div>
			<script type="text/javascript">
				function page(n,s){
					location="${ctx}/list-${category.id}${urlSuffix}?pageNo="+n+"&pageSize="+s;
				}
			</script>
		  </c:if>
		 <c:if test="${category.module eq 'link'}">
			<ul><c:forEach items="${page.list}" var="link">
				<li><a href="${link.href}" target="_blank" style="color:${link.color}"><c:out value="${link.title}" /></a></li>
			</c:forEach></ul>
		  </c:if>
  	  </div> --%>
   </div>
   
   
   <script type="text/javascript">

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
</script>
   
</body>
</html>