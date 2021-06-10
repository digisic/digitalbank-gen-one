package io.digisic.credit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import io.digisic.credit.util.Constants;

@Controller
public class RootController {
	
	/*
	 * Root of application context. Redirects to Swagger UI.
	 */
	@GetMapping(Constants.URI_ROOT)
	public String root() {
		return Constants.DIR_REDIRECT + Constants.URI_SWAGGER_UI;
	}

}
