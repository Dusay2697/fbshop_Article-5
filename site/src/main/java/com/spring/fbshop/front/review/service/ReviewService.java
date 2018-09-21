package com.spring.fbshop.front.review.service;

import java.util.List;

import com.spring.fbshop.front.review.dto.ReviewDto;

public interface ReviewService {

	public void reviewBoardInsert(ReviewDto reviewDto);
	
	public List<ReviewDto> reviewBoardSelectList();
	
	public ReviewDto reviewBoardSelect(int reviewNum);
}
