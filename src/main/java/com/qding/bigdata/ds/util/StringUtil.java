package com.qding.bigdata.ds.util;

import java.text.DecimalFormat;

public class StringUtil {
	/**
	 * 批量判断字符串是否为空
	 *
	 * @param params
	 * @return
	 */
	public static boolean isNull(String... params) {
		for (String param : params) {
			if (param == null || param.trim().equals("")) {
				return true;
			}
		}
		return false;
	}

	public static boolean notNull(String str) {
		return str != null && !"".equals(str.trim());
	}

	public static boolean isNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	public static String decimal(double d) {

	return 	decimal(d,"0.0000");
	}
	public static String decimal(double d,String pattern) {
		
		DecimalFormat df = new DecimalFormat(pattern);// 格式化小数，不足的补0
		return df.format(d);
	}
	public static String toString(Object obj) {
		if(obj instanceof Double||obj instanceof Float){
			DecimalFormat df = new DecimalFormat("0");
			return df.format(obj);
		}
		return String.valueOf(obj);
	}
}
