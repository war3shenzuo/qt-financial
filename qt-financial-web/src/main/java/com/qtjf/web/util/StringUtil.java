package com.qtjf.web.util;

import java.util.Random;

public class StringUtil {

	public static String adminLogin = "adminLogin";

	public static String responseCode = "responseCode";
	public static String responseMsg = "msg";
	public static String responseObj = "obj";
	public static String responseObjList = "objList";

	public static String responseOk = "200";
	public static String resposeError = "500";

	public static String pageCount = "count";
	public static String pageData = "aaData";

	 //生成随机数字和字母,  
    public static String getStringRandom(int length) {  
        String val = "";  
        Random random = new Random();  
        //参数length，表示生成几位随机数  
        for(int i = 0; i < length; i++) {  
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";  
            //输出字母还是数字  
            if( "char".equalsIgnoreCase(charOrNum) ) {  
                //输出是大写字母还是小写字母  
//                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;  
            	int temp = 97;
                val += (char)(random.nextInt(26) + temp);  
            } else if( "num".equalsIgnoreCase(charOrNum) ) {  
                val += String.valueOf(random.nextInt(10));  
            }  
        }  
        return val;  
    }  
    public static void main(String[] args) {
		System.out.println(getStringRandom(8));//输出8位数字加小写字母
	}
}
