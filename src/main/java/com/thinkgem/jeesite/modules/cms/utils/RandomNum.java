package com.thinkgem.jeesite.modules.cms.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class RandomNum {

	public static Map<String, String> USERMAP = new HashMap<String, String>();
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String s=NextInt(100000,999999)+"";
		System.out.println(s);

	}
	
	static Random rand= new Random(); 
	public static int NextInt(final int min, final int max)
	{

	    int tmp = Math.abs(rand.nextInt());
	    return tmp % (max - min + 1) + min;
	}

}
