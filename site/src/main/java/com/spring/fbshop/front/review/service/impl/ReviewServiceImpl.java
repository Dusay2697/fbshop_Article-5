package com.spring.fbshop.front.review.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fbshop.front.review.dao.ReviewDao;
import com.spring.fbshop.front.review.dto.ReviewDto;
import com.spring.fbshop.front.review.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void reviewBoardInsert(ReviewDto reviewDto) {
		reviewDao.reviewBoardInsert(reviewDto);
	}

	@Override
	public List<ReviewDto> reviewBoardSelectList() {
		List<ReviewDto> reviewList = reviewDao.reviewBoardSelectList();
		return reviewList;
	}

	@Override
	public ReviewDto reviewBoardSelect(int reviewNum) {
		ReviewDto reviewSelect = reviewDao.reviewBoardSelect(reviewNum);
		return reviewSelect;
	}

}
