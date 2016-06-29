package com.thinkgem.jeesite.modules.cms.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

public class RandomNum {

	public static ConcurrentHashMap<String, String> USERMAP = new ConcurrentHashMap<String, String>();
	public static Random rand= new Random(); 
	public static int NextInt(final int min, final int max)
	{
	    int tmp = Math.abs(rand.nextInt());
	    return tmp % (max - min + 1) + min;
	}
	
	static {
		System.out.println("------过期验证监控开启-------");
		ExpireCodeMonitor runnable  = new ExpireCodeMonitor();
		Thread thread = new Thread(runnable);
		thread.start();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String s=NextInt(100000,999999)+"";
		System.out.println(s);

	}
	
	static class ExpireCodeMonitor implements Runnable{
		@Override
		public void run() {
			while(true){
				for(Map.Entry<String, String> entry : RandomNum.USERMAP.entrySet()){
					String key=entry.getKey();
					String value=entry.getValue();
					String [] temp = value.split("_");
					long timeOld = Long.parseLong(temp[1]);
					long minute =(new Date().getTime()-timeOld)/1000/60;
					if(minute>10){
						RandomNum.USERMAP.remove(key);
						System.out.println("------移除"+key+"的验证码-------");
					}
				}
				try {
					Thread.sleep(10000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
