package com.spring.fbshop.admin.product.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fbshop.admin.product.dto.ProductDto;
import com.spring.fbshop.admin.product.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/retrieveProduct")
	public ModelAndView userJoinAgreeForm(Map<String,Object> commandMap) {
		
		ModelAndView mView = new ModelAndView();
		
		log.info("상품관리 페이지 진입");
		
		List<ProductDto> productList = productService.selectProductList();
		
		
		mView.addObject("productList", productList);
		mView.setViewName("/admin/product/retrieveProduct"); // jsp 경로
		
		return mView;
	}
	
	@RequestMapping("/insertFormProduct")
	public ModelAndView insertFormProduct(Map<String,Object> commandMap) {
		
		ModelAndView mView = new ModelAndView();
		
		log.info("상품등록 페이지 진입");
		
		
		mView.setViewName("/admin/product/insertFormProduct"); // jsp 경로
		
		return mView;
	}
	
	@RequestMapping("/insertProduct.do")
	public ModelAndView insertProduct(ProductDto productDto) {
		
		ModelAndView mView = new ModelAndView();

		productService.insertProduct(productDto);
		
		mView.setViewName("redirect:retrieveProduct.do"); // jsp 경로
		
		return mView;
	}

	
}
