/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtarticletags.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 病历标签关系Entity
 * @author 赵九扬
 * @version 2016-06-06
 */
public class HmrtArticleTags extends DataEntity<HmrtArticleTags> {
	
	private static final long serialVersionUID = 1L;
	private String articleid;		// articleid
	private String tagsid;		// tagsid
	
	public HmrtArticleTags() {
		super();
	}

	public HmrtArticleTags(String id){
		super(id);
	}

	@Length(min=0, max=64, message="articleid长度必须介于 0 和 64 之间")
	public String getArticleid() {
		return articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}
	
	@Length(min=0, max=64, message="tagsid长度必须介于 0 和 64 之间")
	public String getTagsid() {
		return tagsid;
	}

	public void setTagsid(String tagsid) {
		this.tagsid = tagsid;
	}
	
}