package com.spring.fbshop.admin.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fbshop.admin.product.dto.ProductDto;
import com.spring.fbshop.front.user.dto.UserDto;

@Repository
public class ProductDao {

	@Autowired
	private SqlSession sqlSession;

	public void insertProduct(ProductDto productDto) {
		sqlSession.insert("product.insert", productDto);
	}
	
	public List<ProductDto> selectProductList(){
		List<ProductDto> productList = sqlSession.selectList("product.selectProductList");
		return productList;
	}
	
}
