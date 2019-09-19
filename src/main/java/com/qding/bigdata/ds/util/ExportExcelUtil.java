package com.qding.bigdata.ds.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;

public class ExportExcelUtil {

	public static  Workbook writeNewExcel( String sheetName, List<Object[]> dataList) throws Exception {

		// 声明一个工作薄
		HSSFWorkbook wb = new HSSFWorkbook();
		// 给单子名称一个长度
		// 生成一个样式
		HSSFCellStyle style = wb.createCellStyle();
		// 创建第一行（也可以称为表头）
		HSSFRow row =null;
		// 样式字体居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		int sheetNum=0;
		int lineNum=0;
		HSSFSheet sheet = null;
		for(int i=0;i<dataList.size();i++){
			if(i%50000==0){
				sheet=wb.createSheet(sheetName+(++sheetNum));
				lineNum=0;
			}
			row = sheet.createRow(lineNum );
			for(int j=0;j<dataList.get(i).length;j++){
				row.createCell(j).setCellValue(String.valueOf(dataList.get(i)[j]));
			}
		
			lineNum++;

		}

		return wb;
	}
	public static  void writeNewCsv( OutputStreamWriter writer,List<Object[]> dataList) throws Exception {
		if(dataList.isEmpty()){
			return ;
		}
		int colLenth=dataList.get(0).length;
		for(int i=0;i<dataList.size();i++){
			for(int j=0;j<colLenth;j++){
				  writer.append(String.valueOf(dataList.get(i)[j]));
				  writer.append(",");
			}
			if(i<dataList.size()-1){
				  writer.append("\n");
			}
		}
		
	}

}