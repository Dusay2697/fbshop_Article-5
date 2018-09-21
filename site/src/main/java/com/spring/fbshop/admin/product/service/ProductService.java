package com.spring.fbshop.admin.product.service;

import java.util.List;

import com.spring.fbshop.admin.product.dto.ProductDto;

public interface ProductService {

	public void insertProduct(ProductDto productDto);

	public List<ProductDto> selectProductList();
}
