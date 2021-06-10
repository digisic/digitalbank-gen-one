package io.digisic.bank.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.digisic.bank.util.Constants;

@Controller
@RequestMapping(Constants.URI_MANAGER)
public class WebPromotions extends WebCommonController {
	
	
	/*
	 * Root of application. Redirects to home.
	 */
	@GetMapping(Constants.URI_PROMOTIONS)
	public String promotions() {
		
		
		return Constants.VIEW_PROMOTIONS;
	}

}
