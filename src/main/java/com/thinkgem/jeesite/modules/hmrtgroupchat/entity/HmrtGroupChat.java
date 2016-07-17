/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupchat.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 讨论组聊天记录Entity
 * @author zhuhb
 * @version 2016-07-17
 */
public class HmrtGroupChat extends DataEntity<HmrtGroupChat> {
	
	private static final long serialVersionUID = 1L;
	private String tfrom;		// 来自
	private String tchattype;		// chat类型
	private String tmsg;		// 消息
	private String ttype;		// 消息类型
	private String tlength;		// 长度
	private String turl;		// URL
	private String tfilename;		// 文件名
	private String tsecret;		// t_secret
	private String tlat;		// 纬度
	private String tlng;		// 经度
	private String taddr;		// 地址
	private Long ttimestamp;		// t_timestamp
	private String tto;		// 接收
	private Date tdate;
	
	public Date getTdate() {
		return new Date(ttimestamp);
	}

	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}

	public HmrtGroupChat() {
		super();
	}

	public HmrtGroupChat(String id){
		super(id);
	}

	@Length(min=0, max=32, message="来自长度必须介于 0 和 32 之间")
	public String getTfrom() {
		return tfrom;
	}

	public void setTfrom(String tfrom) {
		this.tfrom = tfrom;
	}
	
	@Length(min=0, max=10, message="chat类型长度必须介于 0 和 10 之间")
	public String getTchattype() {
		return tchattype;
	}

	public void setTchattype(String tchattype) {
		this.tchattype = tchattype;
	}
	
	@Length(min=0, max=2000, message="消息长度必须介于 0 和 2000 之间")
	public String getTmsg() {
		return tmsg;
	}

	public void setTmsg(String tmsg) {
		this.tmsg = tmsg;
	}
	
	@Length(min=0, max=10, message="消息类型长度必须介于 0 和 10 之间")
	public String getTtype() {
		return ttype;
	}

	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	
	@Length(min=0, max=100, message="长度长度必须介于 0 和 100 之间")
	public String getTlength() {
		return tlength;
	}

	public void setTlength(String tlength) {
		this.tlength = tlength;
	}
	
	@Length(min=0, max=200, message="URL长度必须介于 0 和 200 之间")
	public String getTurl() {
		return turl;
	}

	public void setTurl(String turl) {
		this.turl = turl;
	}
	
	@Length(min=0, max=50, message="文件名长度必须介于 0 和 50 之间")
	public String getTfilename() {
		return tfilename;
	}

	public void setTfilename(String tfilename) {
		this.tfilename = tfilename;
	}
	
	@Length(min=0, max=200, message="t_secret长度必须介于 0 和 200 之间")
	public String getTsecret() {
		return tsecret;
	}

	public void setTsecret(String tsecret) {
		this.tsecret = tsecret;
	}
	
	public String getTlat() {
		return tlat;
	}

	public void setTlat(String tlat) {
		this.tlat = tlat;
	}
	
	public String getTlng() {
		return tlng;
	}

	public void setTlng(String tlng) {
		this.tlng = tlng;
	}
	
	@Length(min=0, max=200, message="地址长度必须介于 0 和 200 之间")
	public String getTaddr() {
		return taddr;
	}

	public void setTaddr(String taddr) {
		this.taddr = taddr;
	}
	
	public Long getTtimestamp() {
		return ttimestamp;
	}

	public void setTtimestamp(Long ttimestamp) {
		this.ttimestamp = ttimestamp;
	}
	
	@Length(min=0, max=32, message="接收长度必须介于 0 和 32 之间")
	public String getTto() {
		return tto;
	}

	public void setTto(String tto) {
		this.tto = tto;
	}
	
}