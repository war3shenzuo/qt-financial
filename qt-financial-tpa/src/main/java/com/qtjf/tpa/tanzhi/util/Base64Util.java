package com.qtjf.tpa.tanzhi.util;

import java.io.FileOutputStream;
import java.io.OutputStream;

import com.alibaba.fastjson.util.Base64;

public class Base64Util implements AutoCloseable{

	
	/**
	 * 这里只是为了这个sample示例提供了一个将图片base64字符串转为图片文件的方法
	 * 实际项目中例如web项目，浏览器是直接支持data url的方式显示base64图片的
	 * @param imgBase64 图片的base64字符串
	 * @param fileName 保存的文件名称
	 * @return 返回是否成功生成图片
	 */
	public static  boolean base64ToImg(String imgBase64,String fileName) {
		if (imgBase64 == null||fileName==null)
			return false;
		try(OutputStream out = new FileOutputStream(fileName)){
			byte[] bytes = Base64.decodeFast(imgBase64);
			for (int i = 0; i < bytes.length; ++i)
				if (bytes[i] < 0)
					bytes[i] += 256;
			out.write(bytes);
			out.flush();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args) {
		String data = "iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAIAAAAhotZpAAAC1ElEQVR4nO2d0W6DMAwAx9T//+XuYVIfEM1IYju57u5xZYA4WTFOYo7n8/kle/O9+gbkb5QEQEkAlARASQCUBOBx+dfjOGouf3oBOF23/Xowc5NdLx6rnsYLIwmAkgAoCYCSAFwnDicC63tdg3DXwWVFyPqnYSQBUBIAJQFQEoBbicOJsvG8q+LQvqu8tKLgaRhJAJQEQEkAlARgJHHIoytTaE9ztFmVZYxhJAFQEgAlAVASgL0Sh3ZqEJgp7JYatDGSACgJgJIAKAnASOKQN+oGVhxmlj92/W9BDmIkAVASACUBUBKAW4lD2baCvLpA4JnLnsYLIwmAkgAoCYCSABysov19ZnZ27vZMjCQASgKgJABKAnCdOJT1U2jTtaghr4hQtmTTPg5glARASQCUBCB9O+aJ3V7mf+ka7Wd+bV/3HUYSACUBUBIAJQEYmaoILDGsWuDYVWLIm/W4ebCRBEBJAJQEQEkARhZH5o32M7cxQ2DFYebgdxhJAJQEQEkAlAQgoOV0WV0gr4/DzIUKNmgYSQCUBEBJAJQEoHpx5Mzg3z7ViVVVkoztG0YSACUBUBIAJQG4lTi0mXl7D3zzb9/VibI1Dl24xgGMkgAoCYCSAIxUHPI+67RqPN9ktsXEAYySACgJgJIAxLecnllZmNemKa9MUNBpykgCoCQASgKgJAB7dY5cNSmwahuoicPnoCQASgKgJADXFYeyzzGUTWTMEJgaOFXxsSgJgJIAKAlAwHbMLgKbIMxsmsxbpmHF4Z+iJABKAqAkAOktp/PaNOVdd7clD0YSACUBUBIAJQEYSRxWkTELcOfX5Z/8MpIAKAmAkgAoCcBeiUNZb8i8U2UstTCSACgJgJIAKAlA/HbMQALnJsqmOTIwkgAoCYCSACgJwMhHrvII7PLQZqaIUD+vYSQBUBIAJQFQEoC9+jjIJUYSACUBUBIAJQFQEgAlAVASgB/pDJAi07wYcwAAAABJRU5ErkJggg==";
		System.out.println(base64ToImg(data, "/Volumes/Transcend/tmpl.jpg"));
	}

	@Override
	public void close() throws Exception {
	}
}
