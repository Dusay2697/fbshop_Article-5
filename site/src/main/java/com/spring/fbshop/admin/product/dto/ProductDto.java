package com.spring.fbshop.admin.product.dto;

public class ProductDto {

	private int productCode;
	private String productNm;
	private String productContent;
	private int productPrice;
	private int productCnt;
	private int productSize;
	private int cgyNum;
	private int productSprice;
	private char productSalefg;
	private int productSavemony;

	public ProductDto() {}

	public ProductDto(int productCode, String productNm, String productContent, int productPrice, int productCnt, int productSize, int cgyNum,
			int productSprice, char productSalefg, int productSavemony) {
		this.productCode = productCode;
		this.productNm = productNm;
		this.productContent = productContent;
		this.productPrice = productPrice;
		this.productCnt = productCnt;
		this.productSize = productSize;
		this.cgyNum = cgyNum;
		this.productSprice = productSprice;
		this.productSalefg = productSalefg;
		this.productSavemony = productSavemony;
	}

	public int getproductCode() {
		return productCode;
	}

	public void setproductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getproductNm() {
		return productNm;
	}

	public void setproductNm(String productNm) {
		this.productNm = productNm;
	}

	public String getproductContent() {
		return productContent;
	}

	public void setproductContent(String productContent) {
		this.productContent = productContent;
	}

	public int getproductPrice() {
		return productPrice;
	}

	public void setproductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getproductCnt() {
		return productCnt;
	}

	public void setproductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	public int getproductSize() {
		return productSize;
	}

	public void setproductSize(int productSize) {
		this.productSize = productSize;
	}

	public int getCgyNum() {
		return cgyNum;
	}

	public void setCgyNum(int cgyNum) {
		this.cgyNum = cgyNum;
	}

	public int getproductSprice() {
		return productSprice;
	}

	public void setproductSprice(int productSprice) {
		this.productSprice = productSprice;
	}

	public char getproductSalefg() {
		return productSalefg;
	}

	public void setproductSalefg(char productSalefg) {
		this.productSalefg = productSalefg;
	}

	public int getproductSavemony() {
		return productSavemony;
	}

	public void setproductSavemony(int productSavemony) {
		this.productSavemony = productSavemony;
	};
	
	
	
}
