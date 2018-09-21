package com.spring.fbshop.front.review.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.fbshop.front.review.dto.ReviewDto;
import com.spring.fbshop.front.review.service.ReviewService;
import com.spring.fbshop.front.user.dto.UserDto;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
	public String reviewForm( Model model ) {
		
		List<ReviewDto> reviewList = reviewService.reviewBoardSelectList();
        model.addAttribute("reviewList", reviewList);
		
		return "/front/reviewBoard/reviewBoardForm";
	}
	
	@RequestMapping(value = "/reviewBoardWriteForm", method = RequestMethod.GET)
	public String reviewBoardWriteForm( Model model, HttpSession session) {
        
		return "/front/reviewBoard/reviewBoardWriteForm";
	}
	
	@RequestMapping(value = "/reviewBoardInsert", method = RequestMethod.POST)
	public String reviewBoardInsert(ReviewDto reviewDto, Model model, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		
		UserDto userDto = (UserDto) session.getAttribute("loginUser");
		
		reviewDto.setReviewRegId(userDto.getUserId());
		reviewDto.setUserNum(userDto.getUserNum());
		reviewService.reviewBoardInsert(reviewDto);
		
		return "redirect:/review/reviewForm.do";
	}
	
	@RequestMapping(value = "/reviewBoardSelect", method = RequestMethod.POST)
	public String reviewBoardSelect(@RequestParam("reviewNum") int rv_Num, Model model, HttpSession session) {
		
		ReviewDto reviewSelect = reviewService.reviewBoardSelect(rv_Num);	
		model.addAttribute("reviewSelect",reviewSelect);
		
		return "/front/reviewBoard/reviewBoardWriteForm";
	}
	
}
