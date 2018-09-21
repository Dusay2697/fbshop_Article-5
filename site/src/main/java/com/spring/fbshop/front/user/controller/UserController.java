package com.spring.fbshop.front.user.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fbshop.front.user.dto.UserDto;
import com.spring.fbshop.front.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user")
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userJoinAgreeForm")
	public ModelAndView userJoinAgreeForm(Map<String,Object> commandMap) {
		
		ModelAndView mView = new ModelAndView();
		
		log.info("회원약관 페이지 진입");
		
		userService.test();
		
		mView.setViewName("/front/user/userJoinAgreeForm"); // jsp 경로
		
		return mView;
	}
	
	@RequestMapping("/userLoginForm")
	public String userLoginForm(Map<String,Object> commandMap) {
		
		return "/front/user/userLoginForm";
	}
	
	@RequestMapping("/userJoinForm")
	public ModelAndView userJoinForm(Map<String,Object> commandMap) {
		
		ModelAndView mView = new ModelAndView();
	
		List<Map<String, String>> teamList = userService.selectTeamList();
		
		mView.addObject("teamList", teamList);
		mView.setViewName("/front/user/userJoinForm");
		return mView;
	}
	
	@RequestMapping(value ="/insertUser", method = RequestMethod.POST)
	public ModelAndView insertUser(UserDto userDto) {
		
		ModelAndView mView = new ModelAndView();
		
		userService.insertUser(userDto);
		
		mView.setViewName("/front/user/userJoinDone");
		return mView;
	}
	
	
	@RequestMapping(value = "/idCheck" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String idCheck(HttpServletResponse response,  @RequestParam("uId") String uId, Model model) throws Exception {

		int result = userService.idCheck(uId);
	    String responseMsg;
	    if( result == 0 ) {
	        responseMsg = "{\"msg\":\""+"사용가능한 아이디 입니다."+"\"}";
	    } else {
	  	    responseMsg = "{\"msg\":\""+"사용이 불가한 아이디 입니다."+"\"}";
	    }

		URLEncoder.encode(responseMsg , "UTF-8");
		return responseMsg;
	}
	
	@RequestMapping(value ="/userLogin", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody int userLogin(@RequestParam("userId") String userId , @RequestParam("userPwd") String userPwd
			                          , Model model, HttpServletResponse response , HttpSession session) {
		
		UserDto userDto = new UserDto();
		
		userDto.setUserId(userId);
		userDto.setUserPwd(userPwd);
		
		UserDto userCheck = userService.findUser(userDto);
		
		// 회원에 대한 정보가 없으면 999 반환
		if(userCheck == null) {
			return -1;
		}else {
			session.setAttribute("loginUser", userCheck);
			return 1;
		}
		
	}
	
	@RequestMapping(value ="/userLogout", method = RequestMethod.GET)
	public String userLoginout( Model model, HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "/front/common/main";
		
	}
	
	
}
