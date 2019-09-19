package com.qding.bigdata.ds.service;

import java.util.List;
import java.util.Map;

import com.qding.bigdata.ds.model.UserGroup;

public interface UserGroupService extends BaseService<UserGroup> {

	List<UserGroup> getUserGroups(UserGroup userGroupParam);

	Map<String,Object> getConditionsById(String userGroupId);



}
