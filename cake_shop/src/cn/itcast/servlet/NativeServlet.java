package cn.itcast.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.utils.HttpClientUtil;
import cn.itcast.utils.MD5Util;
import cn.itcast.utils.PayConfig;
import cn.itcast.utils.PayUtil;

/**
 * 生成订单的servlet
 */
@WebServlet("/NativeServlet")
public class NativeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 创建一个空的map集合用来存储各个参数
		TreeMap<String, String> packageParams = new TreeMap<String, String>();
		// 企业号或公众号id
		packageParams.put("appid", PayConfig.appid);
		// 企业收款账号
		packageParams.put("mch_id", PayConfig.partner);
		// 随机字符串
		String nonce_str = PayUtil.getRandomStr();
		packageParams.put("nonce_str", nonce_str);

		//商品名称
		packageParams.put("body", "传智专修学院学费");

		// 附加数据
		packageParams.put("attach", "");

		// 订单号
		String out_trade_no = PayUtil.getRandomStr();
		packageParams.put("out_trade_no", out_trade_no);

		// 支付总金额(微信官方的默认支付单位是分)
		String totalFee=PayUtil.getMoney("0.01");
		packageParams.put("total_fee", totalFee);

		// 生成订单的机器IP
		String ip="127.0.0.1";
		packageParams.put("spbill_create_ip", ip);

		// 回调URL
		packageParams.put("notify_url", PayConfig.notifyurl);

		// 设置支付方式
		packageParams.put("trade_type", "NATIVE");

		// 生成数字签名
		String sign = MD5Util.createSign(packageParams, PayConfig.appid,
				PayConfig.partnerkey);

		// 拼接xml数据
		String xml = "<xml>" + "<appid>" + PayConfig.appid + "</appid>"
				+ "<mch_id>" + PayConfig.partner + "</mch_id>" + "<nonce_str>"
				+ nonce_str + "</nonce_str>" + "<sign>" + sign + "</sign>"
				+ "<body><![CDATA[传智专修学院学费]]></body>" + "<out_trade_no>"
				+ out_trade_no + "</out_trade_no>" + "<attach>" + ""
				+ "</attach>" + "<total_fee>" + totalFee + "</total_fee>"
				+ "<spbill_create_ip>" + ip	+ "</spbill_create_ip>" 
				+ "<notify_url>" + PayConfig.notifyurl	+ "</notify_url>" 
				+ "<trade_type>" + "NATIVE"	+ "</trade_type>" + "</xml>";

		//通过HttpClientUtil向微信支付后台发送xml数据
		String code_url="";
		try {
			String createOrederURL="https://api.mch.weixin.qq.com/pay/unifiedorder";
			HttpClientUtil httpClient=new HttpClientUtil(createOrederURL);
			httpClient.setHttps(true);
			httpClient.setXmlParam(xml);
			httpClient.post();
			String xmlStr=httpClient.getContent(); //从微信支付后台获取订单信息
			System.out.println(xmlStr);
			
			//解析xml数据得到用于支付的url地址
			Map<String, String> map=PayUtil.doXMLParse(xmlStr);
			code_url=map.get("code_url");
			System.out.println(code_url);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//返回订单信息到native.jsp
		String resJson="{\"code_url\":\""+code_url+"\",\"out_trade_no\":\""+out_trade_no+"\"}";
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(resJson);		
	}

}
