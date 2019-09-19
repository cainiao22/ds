package com.qding.bigdata.ds.util;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * 
 * <pre>
 * 类名称：FileUtil
 * 类描述：    文件上传工具类
 * 创建人：Huanglt huanglitai@sina.cn    
 * 创建时间：2016年3月1日 下午4:19:50    
 * 修改人：Huanglt huanglitai@sina.cn     
 * 修改时间：2016年3月1日 下午4:19:50    
 * 修改备注：       
 * &#64;version
 * </pre>
 */
public class FileUtil {

	
	/**
	 * 
	 * 方法: base64 <br>
	 * 描述: 文件转换二进制 <br>
	 * 时间: 2017-4-8 上午11:13:57
	 * @param img
	 * @return
	 * @throws IOException
	 */
	public static byte[] base64(File img) throws IOException {
		BufferedImage bi = ImageIO.read(img);    
		ByteArrayOutputStream baos = new ByteArrayOutputStream();    
		ImageIO.write(bi, "jpg", baos);    
		byte[] bytes = baos.toByteArray();   
		System.out.println(bytes);
//		String trim = new BASE64Encoder().encodeBuffer(bytes).trim();
		return bytes;
	}
	


	/**
	 * 文件下载
	 * 
	 * @param response
	 * @param
	 */
	public static void downloadFile(HttpServletRequest request,
			HttpServletResponse response, String filePath, String fileName) {
		BufferedInputStream bis = null;
		InputStream is = null;
		OutputStream os = null;
		BufferedOutputStream bos = null;
		try {
			File file = new File(filePath);
			is = new FileInputStream(file); // :文件流的声明
			os = response.getOutputStream(); // 重点突出
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(os);

			if (request.getHeader("User-Agent").toLowerCase()
					.indexOf("firefox") > 0) {
				fileName = new String(fileName.getBytes("GB2312"), "ISO-8859-1");
			} else {
				// 对文件名进行编码处理中文问题
				fileName = java.net.URLEncoder.encode(fileName, "UTF-8");// 处理中文文件名的问题
				fileName = new String(fileName.getBytes("UTF-8"), "GBK");// 处理中文文件名的问题
			}

			response.reset(); // 重点突出
			response.setCharacterEncoding("UTF-8"); // 重点突出
			response.setContentType("application/x-msdownload");// 不同类型的文件对应不同的MIME类型
																// // 重点突出
			// inline在浏览器中直接显示，不提示用户下载
			// attachment弹出对话框，提示用户进行下载保存本地
			// 默认为inline方式
			response.setHeader("Content-Disposition", "attachment;filename="
					+ fileName);
			// response.setHeader("Content-Disposition",
			// "attachment; filename="+fileName); // 重点突出
			int bytesRead = 0;
			byte[] buffer = new byte[4096];// 4k或者8k
			while ((bytesRead = bis.read(buffer)) != -1) { // 重点
				bos.write(buffer, 0, bytesRead);// 将文件发送到客户端
			}

		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		} finally {
			// 特别重要
			// 1. 进行关闭是为了释放资源
			// 2. 进行关闭会自动执行flush方法清空缓冲区内容
			try {
				if (null != bis) {
					bis.close();
					bis = null;
				}
				if (null != bos) {
					bos.close();
					bos = null;
				}
				if (null != is) {
					is.close();
					is = null;
				}
				if (null != os) {
					os.close();
					os = null;
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

}
