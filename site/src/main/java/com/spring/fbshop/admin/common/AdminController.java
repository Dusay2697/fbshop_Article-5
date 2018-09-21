package com.spring.fbshop.admin.common;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fbshop.admin.common.upload.ImageService;
import com.spring.fbshop.front.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ImageService imgService;
	
	@RequestMapping("/adminPage")
	public ModelAndView userJoinAgreeForm(Map<String,Object> commandMap) {
		
		ModelAndView mView = new ModelAndView();
		
		log.info("관리자 페이지 진입");
		
		List<Map<String, String>> userListAll = userService.userListAll();
		
		mView.addObject("userListAll", userListAll);
		mView.setViewName("/admin/common/adminPage"); // jsp 경로
		
		return mView;
	}
	
    @RequestMapping(value = "/image" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws IOException, Exception {
    	
    	log.info(":::::::::::::::::"+file);
    	
    	imgService.handleFileUpload(file, response, request);
    	
    	
    	return null;
    }
	
}
