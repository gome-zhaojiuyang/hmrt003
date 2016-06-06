/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupchat.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 分组聊天Entity
 * @author 赵九扬
 * @version 2016-06-06
 */
public class HmrtGroupChat extends DataEntity<HmrtGroupChat> {
	
	private static final long serialVersionUID = 1L;
	private String groupid;		// groupid
	private String userid;		// userid
	private String articleid;		// articleid
	private String content;		// content
	private Date createDt;		// create_dt
	private String beginContent;		// 开始 content
	private String endContent;		// 结束 content
	private Date beginCreateDt;		// 开始 create_dt
	private Date endCreateDt;		// 结束 create_dt
	
	public HmrtGroupChat() {
		super();
	}

	public HmrtGroupChat(String id){
		super(id);
	}

	@Length(min=0, max=64, message="groupid长度必须介于 0 和 64 之间")
	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	
	@Length(min=0, max=64, message="userid长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=64, message="articleid长度必须介于 0 和 64 之间")
	public String getArticleid() {
		return articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}
	
	@Length(min=0, max=512, message="content长度必须介于 0 和 512 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
	
	public String getBeginContent() {
		return beginContent;
	}

	public void setBeginContent(String beginContent) {
		this.beginContent = beginContent;
	}
	
	public String getEndContent() {
		return endContent;
	}

	public void setEndContent(String endContent) {
		this.endContent = endContent;
	}
		
	public Date getBeginCreateDt() {
		return beginCreateDt;
	}

	public void setBeginCreateDt(Date beginCreateDt) {
		this.beginCreateDt = beginCreateDt;
	}
	
	public Date getEndCreateDt() {
		return endCreateDt;
	}

	public void setEndCreateDt(Date endCreateDt) {
		this.endCreateDt = endCreateDt;
	}
		
}