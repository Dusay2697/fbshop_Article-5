package com.spring.fbshop.front.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/front/product")
public class FrontProductController {
	
	@RequestMapping(value = "/productForm", method = RequestMethod.GET)
	public String reviewForm( Model model ) {
		
		
		return "/front/product/retrieveProductForm";
	}
	

	
}
