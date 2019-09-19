package com.qding.bigdata.ds.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.UserGroupDao;
import com.qding.bigdata.ds.model.Tag;
import com.qding.bigdata.ds.model.UserGroup;
import com.qding.bigdata.ds.service.TagService;
import com.qding.bigdata.ds.service.UserGroupService;

@Service
public class UserGroupServiceImpl extends BaseServiceImpl<UserGroup> implements UserGroupService {
    public static Logger logger = LoggerFactory.getLogger(UserGroupServiceImpl.class);
   
    @Autowired
	private UserGroupDao userGroupDao;

	@Autowired
	private TagService tagService;
    
	@Override
	public BaseDao<UserGroup> getDao() {
		return userGroupDao;
	}

	@Override
	public List<UserGroup> getUserGroups(UserGroup userGroupParam) {
		System.out.println(userGroupParam.getCreateUser());
		return userGroupDao.getUserGroups(userGroupParam);
	}

	@Override
	public Map<String, Object> getConditionsById(String userGroupId) {
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		UserGroup userGroupParam = new UserGroup();
		userGroupParam.setId(userGroupId);
		UserGroup userGroup = this.getOne(userGroupParam);
		if(null!=userGroup){
			map.put("reqid", UUID.randomUUID().toString().replace("-", ""));
			map.put("userGroupId", userGroup.getId());

			//获取tag列表
			JSONObject conditions = JSON.parseObject(userGroup.getConditions());
			JSONArray conditionsArr = conditions.getJSONArray("conditions");
			List<String> tagList = new ArrayList<String>();
			for (Object conditionObj : conditionsArr) {
				JSONObject condition = (JSONObject) conditionObj;
				tagList.add(condition.getString("tag").toString());
			}

			//获取tag最新name
			Map<String,String> tagMap = new HashMap<String, String>();
			Map<String,String> dataTypeMap = new HashMap<String, String>();
			if(null!=tagList && tagList.size()>0){
				List<Tag> tags = tagService.listByTags(tagList);
				if(null != tags){
					for (Tag tag:tags ) {
						tagMap.put(tag.getTag(),tag.getName());
						dataTypeMap.put(tag.getTag(),tag.getDataType()+"");
					}
				}
			}

			//处理tag标签name
			if(null != tagMap && tagMap.size()>0){
				for (Object conditionObj : conditionsArr) {
					JSONObject condition = (JSONObject) conditionObj;
					condition.put("tagName",tagMap.get(condition.getString("tag").toString()));
					condition.put("dataType",dataTypeMap.get(condition.getString("tag").toString()));
				}

			}
			map.put("results", conditions);
		}else{
			map.put("reqid",UUID.randomUUID().toString().replace("-", ""));
			map.put("results", "群组ID【"+userGroupId+"】不存在！");
		}

		return map;
	}


}
