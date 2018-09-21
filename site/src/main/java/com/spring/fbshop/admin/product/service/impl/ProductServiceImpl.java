package com.spring.fbshop.admin.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fbshop.admin.product.dao.ProductDao;
import com.spring.fbshop.admin.product.dto.ProductDto;
import com.spring.fbshop.admin.product.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;

	@Override
	public void insertProduct(ProductDto productDto) {
		productDao.insertProduct(productDto);
	}

	@Override
	public List<ProductDto> selectProductList() {
		List<ProductDto> productList = productDao.selectProductList();
		return productList;
	}

}
