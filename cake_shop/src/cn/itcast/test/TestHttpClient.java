package cn.itcast.test;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class TestHttpClient {

	public static void main(String[] args) throws Exception {
		// 1、 创建httpClient对象
		HttpClient client = HttpClients.createDefault();

		// 2、 请求对象
		HttpGet httpGet = new HttpGet(
				"http://api.map.baidu.com/place/v2/search?query=大学&region=郑州"
						+ "&output=json&ak=zbLsuDDL4CS2U0M4KezOZZbGUY9iWtVf");

		// 3、发送请求
		HttpResponse httpResponse = client.execute(httpGet);

		// 4、 打印结果数据
		HttpEntity httpEntity = httpResponse.getEntity();
		System.out.println(EntityUtils.toString(httpEntity));

	}

}
