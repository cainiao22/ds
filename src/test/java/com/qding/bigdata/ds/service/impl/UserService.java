package com.qding.bigdata.ds.service.impl;

import com.qding.bigdata.ds.dao.UserDao;
import com.qding.bigdata.ds.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author yanpf
 * @date 2018/8/13 14:57
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})
public class UserService {

    @Autowired
    private UserDao userDao;

    @Test
    public void testGetByID(){
        User user = new User();
        user.setId("111");
        userDao.getById(user);
    }
}
