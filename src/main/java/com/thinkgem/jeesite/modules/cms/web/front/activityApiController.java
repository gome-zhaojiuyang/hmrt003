/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Comment;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CommentService;
import com.thinkgem.jeesite.modules.cms.utils.ApiUtils;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.IPUtils;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtlike.entity.HmrtLike;
import com.thinkgem.jeesite.modules.hmrtlike.service.HmrtLikeService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 网站Controller
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/activityApi")
public class activityApiController extends BaseController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private HmrtLikeService hmrtLikeService;
	@Autowired
	private CommentService commentService;
	
	/**
	 * 
	 * 查询列表信息
	 */
	@RequestMapping(value = "queryActivityList")
	public void queryActivityList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			//病例表 Article
			Article caseinfo = new Article();
			caseinfo.setCategory(new Category("a1699b0aedce4cdb9c0551d4b36568b0"));
			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
			//caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
			List<Article> list = articleService.findList(caseinfo);
			
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ApiUtils.articleList2MapList(list, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 查询详情信息
	 */
	@RequestMapping(value = "queryActivityById")
	public void queryActivityById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return;
			}
			String id = StringUtils.toString(request.getParameter("id"));

			// 病例表 Article
			
			Article caseinfo = articleService.get(id);
			if(caseinfo==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+id+"]错误！", "")));
				return;
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ApiUtils.article2Map(caseinfo, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 活动 点赞
	 */
	@RequestMapping(value = "activityLike")
	public void activityLike(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			String userid = StringUtils.toString(request.getParameter("userid"));
			if (StringUtils.isEmpty(request.getParameter("articleid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,articleid不能为空！", "")));
				return;
			}
			String articleid = StringUtils.toString(request.getParameter("articleid"));
			
			HmrtLike hmrtLike = new HmrtLike();
			hmrtLike.setUserid(userid);
			hmrtLike.setArticleid(articleid);
			hmrtLikeService.save(hmrtLike);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 活动 点赞 查询
	 */
	@RequestMapping(value = "activityLikeList")
	public void activityLikeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
//			if (StringUtils.isEmpty(request.getParameter("userid"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
//				return;
//			}
//			String userid = StringUtils.toString(request.getParameter("userid"));
			if (StringUtils.isEmpty(request.getParameter("articleid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,articleid不能为空！", "")));
				return;
			}
			String articleid = StringUtils.toString(request.getParameter("articleid"));
			HmrtLike hmrtLike = new HmrtLike();
			hmrtLike.setArticleid(articleid);
			List<HmrtLike> list=hmrtLikeService.findList(hmrtLike);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", list)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 活动 点赞 取消 接口
	 */
	@RequestMapping(value = "activityLikeCancel")
	public void activityLikeCancel(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			String userid = StringUtils.toString(request.getParameter("userid"));
			if (StringUtils.isEmpty(request.getParameter("articleid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,articleid不能为空！", "")));
				return;
			}
			String articleid = StringUtils.toString(request.getParameter("articleid"));
			HmrtLike hmrtLike = new HmrtLike();
			//User user = UserUtils.get(userid);
			//hmrtLike.setUser(user);
			hmrtLike.setUserid(userid);
			hmrtLike.setArticleid(articleid);
			hmrtLikeService.deleteConditon(hmrtLike);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 保存评论
	 */
	@RequestMapping(value = "saveComment")
	public void saveComment(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("content"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,content不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("articleid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,articleid不能为空！", "")));
				return;
			}
//			if (StringUtils.isEmpty(request.getParameter("name"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,name不能为空！", "")));
//				return;
//			}
			
			String userid = StringUtils.toString(request.getParameter("userid"));
			String articleid = StringUtils.toString(request.getParameter("articleid"));
			String content = StringUtils.replaceHtml(StringUtils.toString(request.getParameter("content")));
			//String name = StringUtils.replaceHtml(StringUtils.toString(request.getParameter("name")));

			Article caseinfo = articleService.get(articleid);
			if(caseinfo==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+articleid+"]错误！", "")));
				return;
			}
			
			User user = systemService.getUser(userid);
			//User user = (User)request.getAttribute("user");
			Comment comment = new Comment();
			comment.setCategory(new Category(caseinfo.getCategory().getId()));
			comment.setDelFlag(Article.DEL_FLAG_NORMAL);
			comment.setCreateBy(user);
			comment.setContentId(articleid);
			comment.setTitle(caseinfo.getTitle());
			
			comment.setContent(content);
			//comment.setName(name);
			comment.setIp(IPUtils.getIpAddr(request));
			comment.setCreateDate(new Date());
			commentService.save(comment);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 活动评分+评论列表查询接口 
	 */
	@RequestMapping(value = "queryCommentList")
	public void queryCommentList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
//			if (StringUtils.isEmpty(request.getParameter("userid"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
//				return;
//			}
//			if (StringUtils.isEmpty(request.getParameter("content"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,content不能为空！", "")));
//				return;
//			}
			if (StringUtils.isEmpty(request.getParameter("articleid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,articleid不能为空！", "")));
				return;
			}
//			if (StringUtils.isEmpty(request.getParameter("name"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,name不能为空！", "")));
//				return;
//			}
			
//			String userid = StringUtils.toString(request.getParameter("userid"));
			String articleid = StringUtils.toString(request.getParameter("articleid"));
			
			//Article caseinfo = articleService.get(articleid);
//			if(caseinfo==null){
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+articleid+"]错误！", "")));
//				return;
//			}
			
//			User user = (User)request.getAttribute("user");
			Comment comment = new Comment();
			//comment.setCategory(new Category(caseinfo.getCategory().getId()));
			comment.setContentId(articleid);
			List<Comment> list = commentService.findList(comment);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", list)));
			//Page<Comment> page = commentService.findPage(new Page<Comment>(request,response), comment);
			//outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", page)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
}
