/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

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
import com.thinkgem.jeesite.modules.cms.entity.ArticleData;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.ApiUtils;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtarticletags.entity.HmrtArticleTags;
import com.thinkgem.jeesite.modules.hmrtarticletags.service.HmrtArticleTagsService;
import com.thinkgem.jeesite.modules.hmrtpatient.entity.HmrtPatient;
import com.thinkgem.jeesite.modules.hmrtpatient.service.HmrtPatientService;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 网站Controller
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/caseApi")
public class CaseApiController extends BaseController {
	@Autowired
	private HmrtArticleTagsService hmrtArticleTagsService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private HmrtPatientService hmrtPatientService;
	/**
	 * 
	 * 创建病例接口
	 */
	@RequestMapping(value = "save")
	public void scrollImages(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("patientid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,patientid不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("tagsids"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,tagsids不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("diagnoseInfo"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,diagnoseInfo不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("conditionInfo"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,conditionInfo不能为空！", "")));
				return;
			}
			// String userid =
			// StringUtils.toString(request.getParameter("userid"));
			String patientid = StringUtils.toString(request.getParameter("patientid"));
			String tagsids = StringUtils.toString(request.getParameter("tagsids"));
			String diagnoseInfo = StringUtils.toString(request.getParameter("diagnoseInfo"));
			String conditionInfo = StringUtils.toString(request.getParameter("conditionInfo"));

			HmrtPatient hmrtPatient = hmrtPatientService.get(patientid);
			if(hmrtPatient==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,patientid["+patientid+"]错误，无此患者！", "")));
				return;
			}
			User user = (User) request.getAttribute("user");
			
			// 保存病例表 Article
			Article caseinfo = new Article();
			caseinfo.setIsarchive("0");//// 0否 1是 是否归档到病例库 默认1
			caseinfo.setTitle(user.getName() + "添加病例信息");
			caseinfo.setCategory(new Category("3d1a11de802c4e99a210c4650c816660"));// 资料库
			caseinfo.setDiagnoseInfo(diagnoseInfo);
			caseinfo.setConditionInfo(conditionInfo);
			caseinfo.setUser(user);
			caseinfo.setPatientid(patientid);
			caseinfo.setCreateBy(user);
			//需要articleData
			ArticleData articleData = new ArticleData();
			articleData.setContent(diagnoseInfo+"-"+conditionInfo);
			caseinfo.setArticleData(articleData);
			articleService.save(caseinfo);
			// 保存标签信息 -- 病例标签关系表
			for (String tagsid : tagsids.split(",")) {
				HmrtArticleTags hmrtArticleTags = new HmrtArticleTags();
				hmrtArticleTags.setArticleid(caseinfo.getId());
				hmrtArticleTags.setTagsid(tagsid);
				hmrtArticleTagsService.save(hmrtArticleTags);
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}

	}

	/**
	 * 
	 * 修改病例接口
	 */
	@RequestMapping(value = "updateById")
	public void updateById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return;
			}
			// String userid =
			// StringUtils.toString(request.getParameter("userid"));
			String id = StringUtils.toString(request.getParameter("id"));
			String patientid = StringUtils.toString(request.getParameter("patientid"));
			String tagsids = StringUtils.toString(request.getParameter("tagsids"));
			String diagnoseInfo = StringUtils.toString(request.getParameter("diagnoseInfo"));
			String conditionInfo = StringUtils.toString(request.getParameter("conditionInfo"));

			User user = (User) request.getAttribute("user");
			// 保存病例表 Article
			Article caseinfo = new Article();
			caseinfo.setId(id);
			caseinfo.setIsarchive("0");//// 0否 1是 是否归档到病例库 默认1
			caseinfo.setTitle(user.getName() + "添加病例信息");
			caseinfo.setCategory(new Category("3d1a11de802c4e99a210c4650c816660"));// 资料库
																					// 类别ID
			caseinfo.setDiagnoseInfo(diagnoseInfo);
			caseinfo.setConditionInfo(conditionInfo);
			caseinfo.setUser(user);
			caseinfo.setPatientid(patientid);
			articleService.save(caseinfo);// 有主键id 调用修改方法

			// 修改标签信息 -- 病例标签关系表
			hmrtArticleTagsService.deleteByArticleId(caseinfo.getId());
			for (String tagsid : tagsids.split(",")) {
				HmrtArticleTags hmrtArticleTags = new HmrtArticleTags();
				hmrtArticleTags.setArticleid(caseinfo.getId());
				hmrtArticleTags.setTagsid(tagsid);
				hmrtArticleTagsService.save(hmrtArticleTags);
			}

			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}

	}

	/**
	 * 
	 * 删除病例接口
	 */
	@RequestMapping(value = "deleteById")
	public void deleteById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return;
			}
			String id = StringUtils.toString(request.getParameter("id"));

			User user = (User) request.getAttribute("user");
			// 保存病例表 Article
			Article caseinfo = new Article();
			caseinfo.setId(id);
			caseinfo.setUser(user);
			caseinfo.setDelFlag(Article.DEL_FLAG_DELETE);
			articleService.delete(caseinfo);// 有主键id 调用修改方法
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}

	}
	/**
	 * 
	 * 查询用户病例列表接口
	 */
	@RequestMapping(value = "queryListByUserid")
	public void queryListByUserid(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("pageNo"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,pageNo不能为空！", "")));
				return;
			}

			User user = (User) request.getAttribute("user");
			// 保存病例表 Article
			Article caseinfo = new Article();
			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
			caseinfo.setUser(user);
			caseinfo.setIsarchive("0");
			Page<Article> page = articleService.findPage(new Page<Article>(request,response), caseinfo,false);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", page)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 查询用户病例详情接口
	 */
	@RequestMapping(value = "queryById")
	public void queryById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return;
			}
			String id = StringUtils.toString(request.getParameter("id"));

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
	 * 查询病例库列表信息
	 */
	@RequestMapping(value = "queryArchiveList")
	public void queryArchiveList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			//病例表 Article
			Article caseinfo = new Article();
			caseinfo.setCategory(new Category("5e88c94f3fed4443a0025bac35e25f33"));
			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
			caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
			List<Article> list = articleService.findList(caseinfo);
			
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ApiUtils.articleList2MapList(list, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 查询病例库详情信息
	 */
	@RequestMapping(value = "queryArchiveById")
	public void queryArchiveById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
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
//			Article caseinfo = new Article();
//			caseinfo.setCategory(new Category("5e88c94f3fed4443a0025bac35e25f33"));
//			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
//			caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
//			caseinfo.setId(id);
//			List<Article> list = articleService.findList(caseinfo);
//			if(list==null || list.size()==0){
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+id+"]错误！", "")));
//				return;
//			}
//			caseinfo = list.get(0);
			Article caseinfo = articleService.get(id); 
			if(caseinfo==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+id+"]错误！", "")));
				return;
			}
			// 文章阅读次数+1
			articleService.updateHitsAddOne(id);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ApiUtils.article2Map(caseinfo, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
}
