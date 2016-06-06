/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupuser.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 分组用户Entity
 * @author 赵九扬
 * @version 2016-06-06
 */
public class HmrtGroupUser extends DataEntity<HmrtGroupUser> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// userid
	private String groupid;		// groupid
	
	public HmrtGroupUser() {
		super();
	}

	public HmrtGroupUser(String id){
		super(id);
	}

	@Length(min=0, max=64, message="userid长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=64, message="groupid长度必须介于 0 和 64 之间")
	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	
}