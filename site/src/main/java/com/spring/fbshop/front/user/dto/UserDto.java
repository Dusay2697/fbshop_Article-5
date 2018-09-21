package com.spring.fbshop.front.user.dto;

public class UserDto {

	private int userNum;
	private String userId;
	private String userPwd;
	private String userEmail;
	private String userPhone;
	private String userName;
	private String userAddr;
	private String userBirth;
	private String userCheer;
	private String userSmsfg;
	private String userMailfg;
	private String userRegdt;
	private String userSavemony;
	private String ratingCode;
	
	public UserDto() {}
	
	public UserDto(int userNum, String userId, String userPwd, String userEmail, String userPhone, String userName,
			String userAddr, String userBirth, String userCheer, String userSmsfg, String userMailfg, String userRegdt,
			String userSavemony, String rtCode) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userName = userName;
		this.userAddr = userAddr;
		this.userBirth = userBirth;
		this.userCheer = userCheer;
		this.userSmsfg = userSmsfg;
		this.userMailfg = userMailfg;
		this.userRegdt = userRegdt;
		this.userSavemony = userSavemony;
		this.ratingCode = ratingCode;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserCheer() {
		return userCheer;
	}

	public void setUserCheer(String userCheer) {
		this.userCheer = userCheer;
	}

	public String getUserSmsfg() {
		return userSmsfg;
	}

	public void setUserSmsfg(String userSmsfg) {
		this.userSmsfg = userSmsfg;
	}

	public String getUserMailfg() {
		return userMailfg;
	}

	public void setUserMailfg(String userMailfg) {
		this.userMailfg = userMailfg;
	}

	public String getUserRegdt() {
		return userRegdt;
	}

	public void setUserRegdt(String userRegdt) {
		this.userRegdt = userRegdt;
	}

	public String getUserSavemony() {
		return userSavemony;
	}

	public void setUserSavemony(String userSavemony) {
		this.userSavemony = userSavemony;
	}

	public String getRatingCode() {
		return ratingCode;
	}

	public void setRatingCode(String ratingCode) {
		this.ratingCode = ratingCode;
	}
	
	
	
	
	
	
}
