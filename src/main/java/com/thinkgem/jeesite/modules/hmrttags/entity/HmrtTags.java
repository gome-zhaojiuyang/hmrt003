/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttags.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 病例标签Entity
 * @author 赵九扬
 * @version 2016-06-06
 */
public class HmrtTags extends DataEntity<HmrtTags> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// userid
	private String name;		// name
	private Date createDt;		// create_dt
	private Date beginCreateDt;		// 开始 create_dt
	private Date endCreateDt;		// 结束 create_dt
	
	public HmrtTags() {
		super();
	}

	public HmrtTags(String id){
		super(id);
	}

	@Length(min=0, max=64, message="userid长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=128, message="name长度必须介于 0 和 128 之间")
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