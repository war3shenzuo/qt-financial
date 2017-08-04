package com.qtjf.tpa.tanzhi.util;

/**
 * 简易日志模拟工具
 * @author darren
 *
 */
public class Log {

	public static void print(String msg){
		StackTraceElement st= Thread.currentThread().getStackTrace()[2];
		System.out.println("("+st.getFileName()+":"+st.getLineNumber()+")："+msg);
	}
	public static void print(String msg,Object...params){
		for (Object object : params) {
			msg = msg.replaceFirst("\\{\\}", object.toString());
		}
		StackTraceElement st= Thread.currentThread().getStackTrace()[2];
		System.out.println("("+st.getFileName()+":"+st.getLineNumber()+")："+msg);
	}
}
