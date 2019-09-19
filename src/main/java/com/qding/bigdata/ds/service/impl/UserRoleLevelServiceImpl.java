package com.qding.bigdata.ds.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.UserRoleLevelDao;
import com.qding.bigdata.ds.model.UserRoleLevel;
import com.qding.bigdata.ds.service.UserRoleLevelService;

@Service
public class UserRoleLevelServiceImpl extends BaseServiceImpl<UserRoleLevel>
    implements UserRoleLevelService {
  @Autowired
  private UserRoleLevelDao userRoleLevelDao;
  @Override
  public BaseDao<UserRoleLevel> getDao() {
    return userRoleLevelDao;
  }

}
