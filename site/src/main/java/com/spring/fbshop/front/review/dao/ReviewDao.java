package com.spring.fbshop.front.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fbshop.front.review.dto.ReviewDto;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void reviewBoardInsert(ReviewDto reviewDto) {
		sqlSession.insert("review.reviewBoardInsert",reviewDto);
	}
	
	public List<ReviewDto> reviewBoardSelectList() {
		 List<ReviewDto> reviewList = sqlSession.selectList("review.reviewBoardSelectList");
		 return reviewList;
	}
	
	public ReviewDto reviewBoardSelect(int reviewNum) {
		 ReviewDto reviewSelct = sqlSession.selectOne("review.reviewBoardSelect",reviewNum);
		 return reviewSelct;
	}
	
}
