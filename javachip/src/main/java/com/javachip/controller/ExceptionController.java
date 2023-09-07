package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/error")
public class ExceptionController {
	// Exception test
	@RequestMapping(value="/notGet", method= RequestMethod.POST)
	public String notGet() {
		return "index";
	}
	
	@RequestMapping(value="/exception", method= RequestMethod.GET)
	public String exception() {
		int i = 1 / 0;
		return "index";
	}
	
	@RequestMapping(value="/api/notGet", method= RequestMethod.POST)
	public String apiNotGet() {
		return "post만";
	}
	
	@RequestMapping(value="/api/exception", method= RequestMethod.GET)
	public String apiException() {
		int i = 1 / 0;
		return "예외";
	}
	
	// error 처리
	@RequestMapping(value="/{statusCode}", method= RequestMethod.GET)
	public String errorPage(@PathVariable String statusCode) {
		return "error/"+statusCode;
	}
}
