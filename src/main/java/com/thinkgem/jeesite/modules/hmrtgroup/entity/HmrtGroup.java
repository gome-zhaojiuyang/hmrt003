/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroup.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 聊天分组Entity
 * @author 赵九扬
 * @version 2016-06-06
 */
public class HmrtGroup extends DataEntity<HmrtGroup> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 发起人ID
	private String name;		// 群组名称
	private Date createDt;		// 创建时间
	private Date dismissDt;		// 删除时间
	private Date beginCreateDt;		// 开始 创建时间
	private Date endCreateDt;		// 结束 创建时间
	private Date beginDismissDt;		// 开始 删除时间
	private Date endDismissDt;		// 结束 删除时间
	
	public HmrtGroup() {
		super();
	}

	public HmrtGroup(String id){
		super(id);
	}

	@Length(min=0, max=64, message="发起人ID长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=128, message="群组名称长度必须介于 0 和 128 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDismissDt() {
		return dismissDt;
	}

	public void setDismissDt(Date dismissDt) {
		this.dismissDt = dismissDt;
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
		
	public Date getBeginDismissDt() {
		return beginDismissDt;
	}

	public void setBeginDismissDt(Date beginDismissDt) {
		this.beginDismissDt = beginDismissDt;
	}
	
	public Date getEndDismissDt() {
		return endDismissDt;
	}

	public void setEndDismissDt(Date endDismissDt) {
		this.endDismissDt = endDismissDt;
	}
		
}