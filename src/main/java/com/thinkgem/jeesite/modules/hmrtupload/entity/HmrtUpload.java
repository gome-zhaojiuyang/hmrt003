/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtupload.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 资源上传Entity
 * @author 赵九扬
 * @version 2016-08-21
 */
public class HmrtUpload extends DataEntity<HmrtUpload> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户id
	private String caseid;		// 关联其他id 例如病历上传 关联articleid
	private String remark;		// 图片备注
	private String path;		// 图片链接地址
	
	public HmrtUpload() {
		super();
	}

	public HmrtUpload(String id){
		super(id);
	}

	@Length(min=0, max=64, message="用户id长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=64, message="关联其他id 例如病历上传 关联articleid长度必须介于 0 和 64 之间")
	public String getCaseid() {
		return caseid;
	}

	public void setCaseid(String caseid) {
		this.caseid = caseid;
	}
	
	@Length(min=0, max=512, message="图片备注长度必须介于 0 和 512 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=512, message="图片链接地址长度必须介于 0 和 512 之间")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}