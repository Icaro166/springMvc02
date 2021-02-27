package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.dto.LoginDTO;
import br.com.cotiinformatica.dto.RegisterDTO;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.services.UsuarioService;

@Controller
public class HomeController {
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping("/")
	public ModelAndView login(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		if (request.getSession().getAttribute("usuario_autenticado") != null) {
			modelAndView.setViewName("redirect:home");

		} else {
			modelAndView.setViewName("login");
			modelAndView.addObject("login", new LoginDTO());
		}

		return modelAndView;
	}

	@RequestMapping(value = "loginUser", method = RequestMethod.POST)
	public ModelAndView loginUser(LoginDTO loginDTO, ModelMap map, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			Usuario usuario = usuarioService.findByEmailAndSenha(loginDTO.getEmail(), loginDTO.getSenha());
			if (usuario != null) {

				request.getSession().setAttribute("usuario_autenticado", usuario);

				modelAndView.setViewName("redirect:home");
			} else {
				throw new Exception("Usuário/senha informado está errado ou não existe");
			}
		} catch (Exception e) {
			modelAndView.setViewName("login");
			modelAndView.addObject("login", new LoginDTO());

			map.addAttribute("mensagem_erro", e.getMessage());

		}

		return modelAndView;
	}

	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView modelAndView = new ModelAndView("register");
		modelAndView.addObject("register", new RegisterDTO());
		return modelAndView;
	}

	@RequestMapping(value = "registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(RegisterDTO registerDTO, ModelMap map) {
		ModelAndView modelAndView = new ModelAndView("register");

		try {

			if (!registerDTO.getSenha().equals(registerDTO.getConfirmaSenha())) {
				throw new Exception("Senhas não conferem.");
			}
			if (usuarioService.findByEmail(registerDTO.getEmail()) != null) {
				throw new Exception("O email inforamdo já encontra-se cadastrado. tente outro");
			}
			Usuario usuario = new Usuario();
			usuario.setNome(registerDTO.getNome());
			usuario.setEmail(registerDTO.getEmail());
			usuario.setSenha(registerDTO.getSenha());

			usuarioService.createOrUpdate(usuario);
			map.addAttribute("mensagem_sucesso", "Usuário " + usuario.getNome() + ", cadastrado com sucesso.");

		} catch (Exception e) {
			map.addAttribute("mensagem_erro", e.getMessage());
		}
		modelAndView.addObject("register", new RegisterDTO());

		return modelAndView;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().removeAttribute("usuario_autenticado");

		request.getSession().invalidate();
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		return modelAndView;
	}
}
