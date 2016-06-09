package com.thinkgem.jeesite.modules.cms.utils.huanxin.vo;

import java.net.URL;

import com.thinkgem.jeesite.modules.cms.utils.huanxin.Constants;
import com.thinkgem.jeesite.modules.cms.utils.huanxin.HTTPClientUtils;


/**
 * HTTPClient EndPoints
 * 
 * @author Lynch 2014-09-15
 *
 */
public interface EndPoints {

	static final URL TOKEN_APP_URL = HTTPClientUtils.getURL(Constants.APPKEY.replace("#", "/") + "/token");

	static final URL USERS_URL = HTTPClientUtils.getURL(Constants.APPKEY.replace("#", "/") + "/users");

	static final URL MESSAGES_URL = HTTPClientUtils.getURL(Constants.APPKEY.replace("#", "/") + "/messages");

	static final URL CHATGROUPS_URL = HTTPClientUtils.getURL(Constants.APPKEY.replace("#", "/") + "/chatgroups");

	static final URL CHATFILES_URL = HTTPClientUtils.getURL(Constants.APPKEY.replace("#", "/") + "/chatfiles");

}
