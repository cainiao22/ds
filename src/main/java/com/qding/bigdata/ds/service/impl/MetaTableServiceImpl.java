package com.qding.bigdata.ds.service.impl;

import java.util.*;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.enums.DBTypeEnum;
import com.qding.bigdata.ds.service.MetaDbsService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.MetaFieldDao;
import com.qding.bigdata.ds.dao.MetaTableDao;
import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.service.MetaFieldService;
import com.qding.bigdata.ds.service.MetaTableService;

import javax.annotation.Resource;

@Service
public class MetaTableServiceImpl extends BaseServiceImpl<MetaTable> implements MetaTableService {

	@Autowired
	private MetaTableDao metaTableDao;
	@Autowired
	private MetaFieldService metaFieldService;

	@Autowired
	private MetaFieldDao metaFieldDao;

	private MetaFieldDao dwMetaFieldDao;

	@Autowired
	private Map<String, MetaDbsService> hiveMetaDbsServiceMap;

	@Resource(name = "sqlSessionExecutor")
	public void setMetaFieldDao(SqlSession sqlSession) {
		this.dwMetaFieldDao = sqlSession.getMapper(MetaFieldDao.class);
	}


	@Override
	public BaseDao<MetaTable> getDao() {
		return metaTableDao;
	}

	@Override
	public Result syncFieldMeta(MetaTable metaTable) {
		DBTypeEnum dbTypeEnum = DBTypeEnum.valueOf(metaTable.getDbType());
		if(dbTypeEnum == null){
			return Result.success();
		}
		Result<List<MetaField>> result = hiveMetaDbsServiceMap.get(dbTypeEnum.handlerName).getTableColumns(metaTable.getName(), metaTable.getType());
		if(result.getCode() != 0){
			return result;
		}
		List<MetaField> filedInfoList = result.getData();
		MetaField fieldParams = new MetaField();
		fieldParams.setPage(1);
		fieldParams.setPageCount(999);
		fieldParams.setTableId(metaTable.getId());
		List<MetaField> metaFields = metaFieldDao.list(fieldParams);
		Set<String> set = new HashSet<String>();

		for (MetaField metaField : filedInfoList) {
			set.add(metaField.getName());
			metaField.setTableId(metaTable.getId());
			metaField.setAlias(metaField.getDescription());
			if(isFieldExist(metaField)){
				this.metaFieldService.update(metaField);
			}else {
				this.metaFieldService.save(metaField);
			}
		}

		for (MetaField field : metaFields) {
			if(!set.contains(field.getName()) && field.getIsVirtual() == 0){
				metaFieldDao.delete(field);
			}
		}

		return Result.success();
	}



	private boolean isFieldExist(MetaField metaField) {
		String type = metaField.getType();
		metaField.setType(null);
		List<MetaField> list = this.metaFieldDao.list(metaField);
		metaField.setType(type);
		metaField.setDataType(DataTypeMap.get(type));
		if(list != null && list.size() != 0) {
			metaField.setId(list.get(0).getId());
			return true;
		}
		return false;
	}

	@Override
	public int updateFiled(String fieldId, String key, String value) {
		MetaField metaField=new MetaField();
		metaField.setId(fieldId);
		int v="true".equals(value)?1:0;
		if("isDate".equals(key)) metaField.setIsDate(v);
		else if("isDim".equals(key)) metaField.setIsDim(v);
		else if("isFilter".equals(key)) metaField.setIsFilter(v);
		else if("isMetric".equals(key)) metaField.setIsMetric(v);
		else if("isVirtual".equals(key)) metaField.setIsVirtual(v);
		else if("dataType".equals(key)) metaField.setDataType(Integer.parseInt(value));
		else return 0;
		return this.metaFieldDao.updateById(metaField);
	}

}
