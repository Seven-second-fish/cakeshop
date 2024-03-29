package cn.itcast.test;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class TestMD5 {
	/**
	 * 原版md5加密算法 
	 */
	public static String md5(String plainText) {  // 参数是明文 
		//plainText = plainText + "laksdfjlasdfljasdfjlasdfas0d7f98as6d98f698as6df9"; 
		byte[] secretBytes = null;
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(
					plainText.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("没有md5这个算法！");
		}
		String md5code = new BigInteger(1, secretBytes).toString(16);// 16进制数字
		// 如果生成数字未满32位，需要前面补0
		for (int i = 0; i < 32 - md5code.length(); i++) {
			md5code = "0" + md5code;
		}
		return md5code;  //返回值就是密文
	}

	public static void main(String[] args) { 
		System.out.println(TestMD5.md5("123456"));//202cb962ac59075b964b07152d234b70
	}

}