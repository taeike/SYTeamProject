package controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
public class StartController {

	ModelAndView mv = new ModelAndView();
	@Autowired 
	SessionLocaleResolver localeResolver; 
	@Autowired 
	MessageSource messageSource; 
	
	public StartController() {
	}
	@RequestMapping(value = "startForm")
	public ModelAndView startForm(Locale locale, HttpServletRequest request, Model model) { 
		mv.setViewName("startForm/startForm");
		return mv; 
	}
	
	@RequestMapping(value = "main")
	public ModelAndView main(Locale locale, HttpServletRequest request, Model model) { 
		System.out.println("init main()...");
		System.out.println("선택된 언어 : "+locale);
		mv.addObject("na", messageSource.getMessage("sidebar.login", null, locale));
		mv.setViewName("main/main");
		System.out.println("completer main()");
		return mv; 
	}
	
	
	
}
