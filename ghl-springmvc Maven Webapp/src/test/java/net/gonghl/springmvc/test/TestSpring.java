package net.gonghl.springmvc.test;

import net.gonghl.springmvc.model.UserInfo;
import net.gonghl.springmvc.service.UserInfoService;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpring {

    @Test
    public void test(){
        ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"spring-mvc.xml", "spring-hibernate.xml"});
        
       /* UserService userService = (UserService) ac.getBean("userService");
        userService.test();
        User user = userService.find(3);
        System.out.println(user.getEmail());*/
        
        //UserInfoService userInfoService = (UserInfoService) ac.getBean("userInfoService");
        //userInfoService.findAll();
        
        /*UserInfoController userInfoController = (UserInfoController) ac.getBean("userInfoController");
        userInfoController.findAll(1, 100, null, null);*/
        
        UserInfo us = new UserInfo();
        us.setUsername("12345");
        us.setPassword("123");
        
        UserInfoService userInfoService = (UserInfoService) ac.getBean("userInfoService");
        userInfoService.save(us);
    }
}