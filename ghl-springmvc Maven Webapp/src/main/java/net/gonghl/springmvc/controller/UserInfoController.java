package net.gonghl.springmvc.controller;

import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.gonghl.springmvc.entity.Page;
import net.gonghl.springmvc.model.UserInfo;
import net.gonghl.springmvc.service.UserInfoService;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("userInfoController")
@RequestMapping("/userInfo")
@Scope("prototype")
public class UserInfoController {
	private static Logger log = Logger.getLogger(UserInfoController.class);

	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;

	@ResponseBody
	@RequestMapping(value = "/findAllJson")
	public Object findAll(
			@RequestParam(value = "page", required = true) Integer pageNo,
			@RequestParam(value = "rows", required = true) Integer pageSize,
			HttpServletRequest request, HttpServletResponse response) {
		Enumeration<String> paraNames = request.getParameterNames();
		for (Enumeration<String> e = paraNames; e.hasMoreElements();) {
			String thisName = e.nextElement().toString();
			String thisValue = request.getParameter(thisName);
			log.info("[" + thisName + "] ---- [" + thisValue + "]");
		}
		log.info("UserInfoController findAll");
		Page<UserInfo> results = getUserInfoService().findPageByHql(
				"from UserInfo", pageNo, pageSize);
		Map<String, Object> pagingData = new HashMap<String, Object>();
		pagingData.put("total", results.gettotalRecord());
		pagingData.put("rows", results.getPageRows());
		// ModelAndView mav = new ModelAndView();
		return pagingData;
	}

	@ResponseBody
	@RequestMapping(value = "/findJson")
	public Object findJson(
			@RequestParam(value = "page", required = true) Integer pageNo,
			@RequestParam(value = "rows", required = true) Integer pageSize,
			@RequestParam(value = "userId", required = false) Long userId,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "sexFlag", required = false) String sexFlag,
			HttpServletRequest request, HttpServletResponse response) {
		Enumeration<String> paraNames = request.getParameterNames();
		for (Enumeration<String> e = paraNames; e.hasMoreElements();) {
			String thisName = e.nextElement().toString();
			String thisValue = request.getParameter(thisName);
			log.info("[" + thisName + "] ---- [" + thisValue + "]");
		}
		log.info("UserInfoController findAll");
		String hql = "from UserInfo where 1 =1 ";
		if (userId != null) {
			hql += " and userId = '" + userId + "'";
		}
		if (username != null && !username.equals("")) {
			hql += " and username like '%" + username + "%'";
		}
		if (sexFlag != null && !sexFlag.equals("")) {
			hql += " and sexFlag like '%" + sexFlag + "%'";
		}

		Page<UserInfo> results = getUserInfoService().findPageByHql(hql, null,
				pageNo, pageSize);
		Map<String, Object> pagingData = new HashMap<String, Object>();
		pagingData.put("total", results.gettotalRecord());
		pagingData.put("rows", results.getPageRows());
		// ModelAndView mav = new ModelAndView();
		return pagingData;
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public Object save(UserInfo user, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("/save");
		Enumeration<String> paraNames = request.getParameterNames();
		for (Enumeration<String> e = paraNames; e.hasMoreElements();) {
			String thisName = e.nextElement().toString();
			String thisValue = request.getParameter(thisName);
			log.info("[" + thisName + "] ---- [" + thisValue + "]");
		}
		if (user.getGroupId() == null) {
			user.setGroupId((long) 1);
		}
		if (user.getUserType() == null) {
			user.setUserType("0");
		}
		if (user.getCreateTime() == null) {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			user.setCreateTime(ts);
		}

		log.info(user.getUsername());

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userInfoService.save(user);
			map.put("result", "succ");
		} catch (Exception e) {
			map.put("result", "fail");
		} finally {

		}
		
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/get", method = RequestMethod.POST)
	public UserInfo get(@RequestParam(value = "userId", required = true) Long userId) {
		return userInfoService.get(userId);
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Object update(@RequestParam(value = "userId", required = true) Long userId,
			@RequestParam(value = "telephoneNo", required = true) String telephoneNo,
			@RequestParam(value = "emailAddr", required = true) String emailAddr,
			@RequestParam(value = "sexFlag", required = true) String sexFlag,
			@RequestParam(value = "realname", required = true) String realname) {
		
		String hql = "update UserInfo set telephoneNo = ?, emailAddr = ?, sexFlag = ?, realname = ? where userId = ?";
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userInfoService.executeUpdateByHql(hql, new Object[]{telephoneNo, emailAddr, sexFlag, realname, userId});
			map.put("result", "succ");
		} catch (Exception e) {
			map.put("result", "fail");
		} finally {

		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public Object remove(
			@RequestParam(value = "userId", required = true) Long userId,
			HttpServletRequest request, HttpServletResponse response) {
		log.info("/save");
		Enumeration<String> paraNames = request.getParameterNames();
		for (Enumeration<String> e = paraNames; e.hasMoreElements();) {
			String thisName = e.nextElement().toString();
			String thisValue = request.getParameter(thisName);
			log.info("[" + thisName + "] ---- [" + thisValue + "]");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userInfoService.deleteById(userId);
			map.put("result", "succ");
		} catch (Exception e) {
			map.put("result", "fail");
		} finally {

		}
		
		return map;
	}

	@ResponseBody
	@RequestMapping("/find/{Id}")
	public UserInfo find(@PathVariable Long Id) {
		return userInfoService.get(Id);
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	@Resource(name = "userInfoService")
	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

}
