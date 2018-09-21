package com.spring.fbshop;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.fbshop.admin.product.dto.ProductDto;
import com.spring.fbshop.admin.product.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/main")
	public String home(Locale locale, Model model) {
		
		List<ProductDto> productList = productService.selectProductList();
		model.addAttribute("productList", productList);

		return "/front/common/main";
	}
	
}
