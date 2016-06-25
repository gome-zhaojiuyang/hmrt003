/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorelog.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 积分日志Entity
 * @author 赵九扬
 * @version 2016-06-25
 */
public class HmrtScoreLog extends DataEntity<HmrtScoreLog> {
	
	private static final long serialVersionUID = 1L;
	private String ruleid;		// 规则ID
	private String name;		// 规则名称
	private String score;		// 积分
	private String userid;		// 用户ID
	private Date createDt;		// 创建时间
	private Date beginCreateDt;		// 开始 创建时间
	private Date endCreateDt;		// 结束 创建时间
	
	public HmrtScoreLog() {
		super();
	}

	public HmrtScoreLog(String id){
		super(id);
	}

	@Length(min=0, max=64, message="规则ID长度必须介于 0 和 64 之间")
	public String getRuleid() {
		return ruleid;
	}

	public void setRuleid(String ruleid) {
		this.ruleid = ruleid;
	}
	
	@Length(min=0, max=128, message="规则名称长度必须介于 0 和 128 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=11, message="积分长度必须介于 0 和 11 之间")
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	@Length(min=0, max=64, message="用户ID长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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