/*
 * Created on 2015-09-14 16:21:00
 *
 */
package com.thinkgem.jeesite.modules.cms.utils;

/**
 * @author Liyiwei
 * 
 */
public class ResponseData implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer code;
	private String msg;
	private Object data;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}