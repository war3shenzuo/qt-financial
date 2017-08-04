
package com.qtjf.tpa.tanzhi.server;

import java.nio.charset.Charset;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qtjf.tpa.tanzhi.mobile.MobileReport;
import com.qtjf.tpa.tanzhi.util.HttpRequest;
import com.qtjf.tpa.tanzhi.util.Log;
import com.qtjf.tpa.tanzhi.util.MapParamUtil;

public class ReportDemoClient {
	
	private static final String api = "http://api.tanzhishuju.com/api/gateway";
	private static final String key ="系统分配的Key";
	private static final String secret ="系统分配的Secret";
	private static final String version ="1.0.0";

	public static void main(String[] args) throws Exception {
		Map<String,Object> param = initMap( "api.mobile.report");//构造基础请求参数（method、apiKey、version）
		//必填参数 申请人的基础信息
		param.put("username","13888888888");//手机号
		param.put("password", Base64.getEncoder().encodeToString("123456".getBytes(Charset.forName("UTF-8"))));//运营商密码Base64
		param.put("trueName","张三");//姓名
		param.put("idCard","110101199910101234");//身份证号
		param.put("userProvince","上海");//居住省份
		param.put("userCity","杨浦区");//居住城市
		param.put("userAddress","黄兴路217号");//详细地址
		//可选参数  手机设备号
		param.put("deviceId","00000000000000");//手机设备号（手机拨号界面*#06#获取）
		//可选参数  常用联系人
		param.put("contacts[0].name","联系人1姓名");
		param.put("contacts[0].cellphone","联系人1电话");
		param.put("contacts[1].name","联系人2姓名");
		param.put("contacts[1].cellphone","联系人2电话");
		//...contacts[2]...contacts[3]
		//以此类推 索引最高为4（最多允许传入5个常用联系人信息）
		param.put("contacts[4].name","联系人4姓名");
		param.put("contacts[4].cellphone","联系人4电话");
		//参数传入完毕

		/***********************************************************/
		/***********************************************************/
		param.put("version", "1.0.1");		  //由于增加了reportVersion参数，任务提交接口的版本号升级到1.0.1
		param.put("reportVersion", "1.1.0");  //运营商报告获取1.1.0版本
		/***********************************************************/
		/***********************************************************/
		
		JSONObject json = submitTask(param);//调用报告方法 提交报告请求（内含参数签名）
		
		if("0010".equals(json.get("code"))){
			String token = json.getString("token");
			//轮询状态
			while (true) {
				json = checkStatus(token);
				if("0001".equals(json.get("code"))){//需要输入短信验证码 调用输入短信验证码的方法
					sendAuthCode(token);//调用发送短信验证码的方法（注意需要传入业务流程唯一Token）
				}else if("0000".equals(json.get("code"))){//运营商数据获取完成
					json = getResult(token);//调用获取结果的接口获取最终的运营商报告
					if("0000".equals(json.get("code"))){
						MobileReport report = json.getObject("data", MobileReport.class);//获取结果成功后直接获取数据  完整的数据模型为 MobileReport
						System.out.println("已经获取到最终的运营商报告：");
						System.out.println(JSON.toJSONString(report));
					}else{
						System.out.println(json.toJSONString());
					}
					break;
				}else if("1102".equals(json.get("code"))){
					Log.print(("运营商密码错误，程序结束，请重新开始！"));
					break;
				}else if("2008".equals(json.get("code"))){
					Log.print(("短信验证码错误，程序结束，请重新开始！"));
					break;
				}else if(json.getString("code").length()>0&&json.getString("code").indexOf("0")!=0){//code不是空字符串   并且 状态码不是以0xxx开头表示出现错误，结束
					Log.print("出现错误，错误码：{}，错误消息：{}，程序结束，请重新开始。如有疑问请查阅API文档！",json.get("code"),json.get("msg"));
					break;
				}else{
					Thread.sleep(5000);
				}
			}
			System.out.println("结束");
		}
	}
	
	/**
	 * 提交业务
	 * @return
	 */
	public static JSONObject submitTask(Map<String,Object> param){
		param.put("sign", MapParamUtil.signParam(param,secret));//参数签名
		String result = HttpRequest.post(api).put(param).send(); 
		System.out.println("submitTask:\t"+result);
		return JSON.parseObject(result);
	}
	
	/**
	 * 检查业务状态
	 * @param token
	 * @return
	 */
	public static JSONObject checkStatus(String token){
		Map<String,Object> param = initMap( "api.common.getStatus");
		param.put("token", token);
		param.put("sign", MapParamUtil.signParam(param,secret));//参数签名
		JSONObject result = JSON.parseObject(HttpRequest.post(api).put(param).send());
		if("".equals(result.getString("code"))){
			System.out.print(">");
		}else{
			System.out.println("\ncheckStatus:\t"+result);
		}
		return result;
	}
	
	/**
	 * 发送短信验证码
	 * @param token
	 * @param smsCode
	 * @return
	 */
	@SuppressWarnings("resource")
	public static JSONObject sendAuthCode(String token){
		Map<String,Object> param = initMap( "api.mobile.sendSms");
		param.put("token", token);
		Scanner sc = new Scanner(System.in);
		System.out.print("请输入短信验证码：");
		param.put("smsCode",sc.next());
		param.put("sign", MapParamUtil.signParam(param,secret));//参数签名
		String result = HttpRequest.post(api).put(param).send();
		System.out.println("sendAuthCode:\t"+result);
		return JSON.parseObject(result);
	}
	
	/**
	 * 查询结果
	 * @param token
	 * @return
	 */
	public static JSONObject getResult(String token){
		Map<String,Object> param = initMap( "api.common.getResult");
		param.put("token", token);
		param.put("bizType", "mobilereport");
		param.put("sign", MapParamUtil.signParam(param,secret));
		System.out.println(">>>>>>>>>>>>>>>开始获取结果");
		String result = HttpRequest.post(api).put(param).send();
		System.out.println("<<<<<<<<<<<<<<<获取结果完成");
		return JSON.parseObject(result);
	}
	
	/**
	 * 构造基础的Map
	 * @param method
	 * @return
	 */
	private static Map<String,Object> initMap(String method){
		Map<String,Object> param = new HashMap<>();
		param.put("method",method);
		param.put("apiKey", key);
		param.put("version", version);
		return param;
	}
}
