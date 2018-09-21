package com.spring.fbshop.front.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fbshop.front.user.dto.UserDto;

@Repository
public class UserDao {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insertUser(UserDto userDto) {
		sqlSession.insert("user.inserUser", userDto);
	}

	public void test() {
//		UserDto user = sqlSession.selectOne("user.test");
		
//		log.info(sqlSession.selectOne("user.test"));
	}

	public int idCheck(String uId) {
		return sqlSession.selectOne("user.idCheck", uId);
	}

	public List<Map<String, String>> selectTeamList() {
		return sqlSession.selectList("team.selectTeamList");
	}

	public List<Map<String, String>> userListAll() {
		return sqlSession.selectList("user.userListAll");
	}
	
	
	public UserDto findUser(UserDto userDto) {
		return sqlSession.selectOne("user.findUser", userDto);
	}
}
