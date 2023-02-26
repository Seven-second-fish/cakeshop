package cn.itcast.servlet;

import java.io.IOException;

import java.text.ParseException;
import java.util.Date;
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
 * 检测支付状态的servlet
 */
@WebServlet("/PayStatusCheckServlet")
public class PayStatusCheckServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获得页面传过来的订单号
		String out_trade_no = request.getParameter("out_trade_no");
		
		//2.获得初始时间
		long requestTime=new Date().getTime();
		
		//3.开始检测支付状态
		while(true){
			 //调用queryOrderStatus方法进行查询
			 Map<String, String> resMap=queryOrderStatus(out_trade_no);
			 if(resMap.get("trade_state").equals("SUCCESS")){
				 //把订单支付状态返回页面
				 request.getSession().setAttribute("resMap", resMap);
				 response.getWriter().write(resMap.get("trade_state"));
				 break;
			 }
			
			//超时(30秒)
			if(new Date().getTime() - requestTime > 30000){
				break;
			}
			
			//每隔三秒查询一次
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	public Map<String, String> queryOrderStatus(String out_trade_no) {
		// 创建一个空的map集合用来存储各个参数
		TreeMap<String, String> packageParams = new TreeMap<String, String>();
		// 企业号或公众号id
		packageParams.put("appid", PayConfig.appid);
		// 企业收款账号
		packageParams.put("mch_id", PayConfig.partner);
		// 订单号
		packageParams.put("out_trade_no", out_trade_no);
		// 随机字符串
		String nonce_str = PayUtil.getRandomStr();
		packageParams.put("nonce_str", nonce_str);
		// 生成数字签名
		String sign = MD5Util.createSign(packageParams, PayConfig.appid,
				PayConfig.partnerkey);

		// 拼接xml数据
		String xml = "<xml>" + "<appid>" + PayConfig.appid + "</appid>"
				+ "<mch_id>" + PayConfig.partner + "</mch_id>"
				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>"
				+ "<nonce_str>" + nonce_str + "</nonce_str>" + "<sign>" + sign
				+ "</sign>" + "</xml>";

		// 通过HttpClientUtil向微信支付后台发送xml数据
		Map<String, String> map=null;
		try {
			String queryOrderURL = "https://api.mch.weixin.qq.com/pay/orderquery";
			HttpClientUtil httpClient = new HttpClientUtil(queryOrderURL);
			httpClient.setHttps(true);
			httpClient.setXmlParam(xml);
			httpClient.post();
			String xmlStr = httpClient.getContent(); // 从微信支付后台获取支付状态
			System.out.println(xmlStr);

			// 把xml数据解析为map集合
			map = PayUtil.doXMLParse(xmlStr);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("查询订单状态:"+map);
		return map;
	}
}
