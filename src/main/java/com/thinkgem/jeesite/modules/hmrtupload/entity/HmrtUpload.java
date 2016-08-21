/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtupload.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

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
	private String title;		// 标题
	private String groupid;		// 分组id
	private String type;		// 010图片  020文字
	private String desc;		// 文字详情
	private String status;		// 状态010启用  020禁用
	private Date createdate;		// 创建时间
	private Date updatedate;		// 更新时间
	private String resname;		// 资源名称
	
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
	
	@Length(min=0, max=512, message="标题长度必须介于 0 和 512 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=64, message="分组id长度必须介于 0 和 64 之间")
	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	
	@Length(min=0, max=8, message="010图片  020文字长度必须介于 0 和 8 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=512, message="文字详情长度必须介于 0 和 512 之间")
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Length(min=0, max=8, message="状态010启用  020禁用长度必须介于 0 和 8 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Length(min=0, max=512, message="资源名称长度必须介于 0 和 512 之间")
	public String getResname() {
		return resname;
	}

	public void setResname(String resname) {
		this.resname = resname;
	}
	
}