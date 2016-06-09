/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtlike.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 活动点赞Entity
 * @author 赵九扬
 * @version 2016-06-09
 */
public class HmrtLike extends DataEntity<HmrtLike> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户编号
	private String articleid;		// 文章编号
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public HmrtLike() {
		super();
	}

	public HmrtLike(String id){
		super(id);
	}

	@Length(min=0, max=64, message="用户编号长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=64, message="文章编号长度必须介于 0 和 64 之间")
	public String getArticleid() {
		return articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}
	
}