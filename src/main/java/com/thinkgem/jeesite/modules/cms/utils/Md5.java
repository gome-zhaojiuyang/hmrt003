/*
 * Created on 2012-4-02 11:14:00
 *
 */
package com.thinkgem.jeesite.modules.cms.utils;

import java.security.MessageDigest;

/**
 * @author Liyiwei
 * 
 */
public class Md5 {
	public static String encrypt(String input) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			return ByteUtil.bytesToHex(messageDigest.digest(input.getBytes()));
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}