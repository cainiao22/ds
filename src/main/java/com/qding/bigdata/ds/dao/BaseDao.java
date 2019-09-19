
package com.qding.bigdata.ds.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qding.bigdata.ds.model.BaseModel;
import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.model.scheduler.SchedulerJobDependency;

public interface BaseDao<T extends BaseModel> {
	List<T> list(T t);

	void save(T t);

	int updateById(T t);

	T getById(T t);

	Integer count(T t);

	void delete(T t);

	List<T> listByIDs(@Param("ids") String ids);




}
