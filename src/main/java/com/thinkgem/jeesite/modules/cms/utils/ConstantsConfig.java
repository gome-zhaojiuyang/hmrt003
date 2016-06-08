/*
 * Created on 2014-06-12 18:04:00
 *
 */
package com.thinkgem.jeesite.modules.cms.utils;



public class ConstantsConfig {
	public static String SECRET_KEY = "ec0405c5aef93e771cd80e0db180b88b";
	//public static String PIC_PATH = "http://127.0.0.1:8080/baidai/upload";
	public static String PIC_PATH = "http://123.57.54.170:8080/baidai/upload";
	public static int PAGE_SIZE = 10;
	
	public static String SMS_SITE = "http://www.stongnet.com/sdkhttp/";
	public static String SMS_API_SEND = "sendsms.aspx";
	public static String SMS_REG = "101100-WEB-HUAX-602827";
	public static String SMS_PWD = "OZRAKBSI";
	public static String SMS_VerificationCode = "验证码：@，请在5分钟内完成验证，请勿透露给其他人。工作人员不会向您索要验证码，如非本人操作请忽略。【百代旅行】";
	
	public static String OAUTH_WEIXIN_URL = "https://api.weibo.com/oauth2/access_token";
	public static String OAUTH_WEIBO_URL = "https://api.weibo.com/oauth2/access_token";
	public static String OAUTH_QQ_URL = "https://api.weibo.com/oauth2/access_token";
	
	
	//环信接口 具体配置参照emchat.jar
	// API_HTTP_SCHEMA
	public static String API_HTTP_SCHEMA = "https";
	// API_SERVER_HOST
	public static String API_SERVER_HOST = "a1.easemob.com";
	// APPKEY
	public static String APPKEY = "bdtravel#mybdtravel";
	// APP_CLIENT_ID
	public static String APP_CLIENT_ID = "YXA6IhHLkJDaEeWasTlLnCgeQA";
	// APP_CLIENT_SECRET
	public static String APP_CLIENT_SECRET = "YXA6sbIxWCcl0N6Kdd3Ku5xsvLH54zY";
	// DEFAULT_PASSWORD
	public static String DEFAULT_PASSWORD = "123456";
	//EMCHAT_PREFIX
	public static String EMCHAT_PREFIX = "hmrt_";
	
	//极光发送通知
	// APPKEY
	public static String J_APPKEY = "44cd5abe0d4f28ba260fd2cc";
	// masterSecret
	public static String J_MASTER_SECRET = "23d965fc8d07dc33a9814953";
	
	
	//银联基本信息配置 
	//商户号
	public static String UPAY_MERID = "777290058122170" ;
	// 字符集编码 默认"UTF-8"
	public static String UPAY_ENCODING = "UTF-8" ;
	/**
	 * 取值：000101：基金业务之股票基金；000102：基金业务之货币基金；000201：B2C网关支付；000301：无跳转（商户侧）；000302：评级支付；000401：代付；000501：代收；000601：账单支付；000801：无跳转（机构侧）；000901：绑定支付；000902: Token支付；001001：订购；000202：B2B
除以上产品外其他接口默认送000000，对账文件下载接口必送000000
	 */
	public static String UPAY_BIZTYPE 	 = "000201" ;
	public static String UPAY_ACCESSTYPE = "0" ;
	public static String UPAY_FRONTURL 	 = "" ;
	public static String UPAY_BACKURL 	 = "http://123.57.23.239:9090/bdApi/trade/upayBack" ;
	
	//sftp
	public static String SFTP_HOST 		= "123.57.54.170" ;
	public static int 	 SFTP_PORT 		= 22 ;
	public static String SFTP_USERNAME 	= "bdsftp" ;
	public static String SFTP_PASSWORD 	= "!QAZXSW@" ;
	public static String SFTP_ROOT 		= "/shared/" ;
	
	public static String USER_SALT 		= "hmrt" ;
}