package com.thinkgem.jeesite.modules.cms.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;

public class ApiUtils {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public static List<Map<String,String>> articleList2MapList(List<Article> list,ArticleDataService articleDataService ){
		List<Map<String,String>> articleMapList = new ArrayList<Map<String,String>>();
		for(Article article: list){
			Map<String,String> articleMap = new HashMap<String,String>();
			articleMap.put("title", article.getTitle());
			articleMap.put("begindata", DateUtils.formatDateTime(article.getBeginDate()));
			articleMap.put("enddata", DateUtils.formatDateTime(article.getEndDate()));
			//articleMap.put("allowcomment", article.getArticleData().getAllowComment());
			articleMap.put("creatdata", DateUtils.formatDateTime(article.getCreateDate()));
			articleMap.put("image", article.getImage());
			articleMap.put("imageSrc", article.getImageSrc());
			articleMap.put("content", articleDataService.get(article.getId()).getContent());
			articleMap.put("desc", article.getDescription());
			articleMap.put("weight", article.getWeight().toString());
			//articleMap.put("category", article.getCategory());
			articleMap.put("id", article.getId());
			articleMap.put("commentcount", article.getCommentcount()+"");
			articleMapList.add(articleMap);
		}
		
		return articleMapList ;
	}
	
	public static Map<String,String> article2Map(Article article,ArticleDataService articleDataService ){
		Map<String,String> articleMap = Maps.newHashMap();
		articleMap.put("title", article.getTitle());
		articleMap.put("begindata", DateUtils.formatDateTime(article.getBeginDate()));
		articleMap.put("enddata", DateUtils.formatDateTime(article.getEndDate()));
		//articleMap.put("allowcomment", article.getArticleData().getAllowComment());
		articleMap.put("creatdata", DateUtils.formatDateTime(article.getCreateDate()));
		articleMap.put("image", article.getImage());
		articleMap.put("imageSrc", article.getImageSrc());
		articleMap.put("content", articleDataService.get(article.getId()).getContent());
//		articleMap.put("diagnoseInfo", article.getDiagnoseInfo());
//		articleMap.put("conditionInfo", article.getConditionInfo());
		articleMap.put("desc", article.getDescription());
		articleMap.put("weight", null);
		//articleMap.put("category", article.getCategory());
		articleMap.put("id", article.getId());
		return articleMap ;
	}
	
	public static List<Map<String,String>> caseList2MapList(List<Article> list,ArticleDataService articleDataService ){
		List<Map<String,String>> articleMapList = new ArrayList<Map<String,String>>();
		for(Article article: list){
			Map<String,String> articleMap = new HashMap<String,String>();
			articleMap.put("title", article.getTitle());
//			articleMap.put("image", article.getImage());
			articleMap.put("imageSrc", article.getImageSrc());
			articleMap.put("content", articleDataService.get(article.getId()).getContent());
			articleMap.put("id", article.getId());
			articleMapList.add(articleMap);
		}
		
		return articleMapList ;
	}
	public static Map<String,String> case2Map(Article article,ArticleDataService articleDataService ){
		Map<String,String> articleMap = Maps.newHashMap();
		articleMap.put("title", article.getTitle());
//		articleMap.put("begindata", DateUtils.formatDateTime(article.getBeginDate()));
//		articleMap.put("enddata", DateUtils.formatDateTime(article.getEndDate()));
		//articleMap.put("allowcomment", article.getArticleData().getAllowComment());
//		articleMap.put("creatdata", DateUtils.formatDateTime(article.getCreateDate()));
//		articleMap.put("image", article.getImage());
		articleMap.put("imageSrc", article.getImageSrc());
		articleMap.put("content", articleDataService.get(article.getId()).getContent());
//		articleMap.put("diagnoseInfo", article.getDiagnoseInfo());
//		articleMap.put("conditionInfo", article.getConditionInfo());
//		articleMap.put("desc", article.getDescription());
//		articleMap.put("weight", null);
		//articleMap.put("category", article.getCategory());
		articleMap.put("id", article.getId());
		return articleMap ;
	}
	public static Map<String,String> article2MapCaseDetail(Article article,ArticleDataService articleDataService ){
		Map<String,String> articleMap = Maps.newHashMap();
		articleMap.put("userName", article.getUserName());
//		articleMap.put("begindata", DateUtils.formatDateTime(article.getBeginDate()));
//		articleMap.put("enddata", DateUtils.formatDateTime(article.getEndDate()));
		//articleMap.put("allowcomment", article.getArticleData().getAllowComment());
//		articleMap.put("creatdata", DateUtils.formatDateTime(article.getCreateDate()));
		articleMap.put("visitDt", DateUtils.formatDate(article.getVisitDt(),null));
		articleMap.put("image", article.getImage());
		articleMap.put("imageSrc", article.getImageSrc());
		//articleMap.put("content", articleDataService.get(article.getId()).getContent());
		articleMap.put("diagnoseInfo", article.getDiagnoseInfo());
		articleMap.put("conditionInfo", article.getConditionInfo());
		articleMap.put("desc", article.getDescription());
		articleMap.put("weight", null);
		//articleMap.put("category", article.getCategory());
		articleMap.put("id", article.getId());
		return articleMap ;
	}

}
