package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AgendaController {
	
@RequestMapping("/home")
public ModelAndView home(HttpServletRequest request) {
 ModelAndView modelAndView = new ModelAndView();
 if (request.getSession().getAttribute("usuario_autenticado") != null) {
	modelAndView.setViewName("agenda/home");
}
 
 else {
	 modelAndView.setViewName("redirect:/");
	
}
 //Usuario usuario=(Usuario) request.getSession().getAttribute("usuario_autenticado");
 
return modelAndView;
}

}
