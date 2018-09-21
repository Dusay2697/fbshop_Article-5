package com.spring.fbshop.front.user.service;

import java.util.List;
import java.util.Map;

import com.spring.fbshop.front.user.dto.UserDto;

public interface UserService {

	public void test();

	public int idCheck(String uId);

	public void insertUser(UserDto userDto);
	
	public List<Map<String, String>> selectTeamList();

	public List<Map<String, String>> userListAll();
	
	public UserDto findUser(UserDto userDto);
}
