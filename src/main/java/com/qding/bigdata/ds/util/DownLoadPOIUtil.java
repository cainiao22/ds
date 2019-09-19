package com.qding.bigdata.ds.util;

import com.qding.bigdata.ds.model.ExportTitle;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import java.io.OutputStream;
import java.util.*;

/**
 * @author yanpf
 * @date 2018/5/25 10:07
 * @description
 */
public class DownLoadPOIUtil {

    public static void createFixationSheet(OutputStream os,LinkedHashMap<String, ExportTitle> titles,
                                    List<Map<String, Object>> dataList) throws Exception {
        //排序title
        List<Map.Entry> entryList = new ArrayList<Map.Entry>();
        for(Map.Entry e : titles.entrySet()){
            entryList.add(e);
        }
        Collections.sort(entryList, new Comparator<Map.Entry>() {
            @Override
            public int compare(Map.Entry o1, Map.Entry o2) {
                return ((ExportTitle)o1.getValue()).compareTo((ExportTitle)o2.getValue());
            }
        });
        LinkedHashMap<String, ExportTitle> sortedTitle = new LinkedHashMap<String, ExportTitle>();
        for (Map.Entry<String, ExportTitle> entry : entryList) {
            sortedTitle.put(entry.getKey(), entry.getValue());
        }
        // 创建工作薄
        SXSSFWorkbook wb = new SXSSFWorkbook();
        // 在工作薄上建一张工作表
        Sheet sheet = wb.createSheet();
        int i = 0;
        int titleIndex = 0;
        Row rowi = sheet.createRow(i++);
        for (Map.Entry<String, ExportTitle> titleEntry : sortedTitle.entrySet()) {
            ExportTitle value = titleEntry.getValue();
            String title = value == null ? null : value.getName();
            cteateCell(wb, rowi, titleIndex,  title);
            titleIndex ++;
        }
        Iterator<Map<String, Object>> iterator = dataList.iterator();
        while (iterator.hasNext()) {
            rowi = sheet.createRow(i++);
            Map<String, Object> data = iterator.next();
            int j = 0;
            for (Map.Entry<String, ExportTitle> titleEntry : sortedTitle.entrySet()) {
                Object value = data.get(titleEntry.getKey());
                cteateCell(wb, rowi, j,  value == null ? null : value.toString());
                j ++;
            }

        }
        wb.write(os);
        os.flush();
        os.close();

    }

    private static void cteateCell(SXSSFWorkbook wb, Row row, int col,
                            String val) {
        Cell cell = row.createCell(col);
        cell.setCellType(Cell.CELL_TYPE_STRING);
        cell.setCellValue(val);
        /*HSSFCellStyle cellstyle = wb.createCellStyle();
        cellstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);
        cell.setCellStyle(cellstyle);*/
    }
}
