package br.com.cotiinformatica.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.dto.CadastroCompromissoDTO;
import br.com.cotiinformatica.entities.Compromisso;
import br.com.cotiinformatica.enums.PrioridadeCompromisso;
import br.com.cotiinformatica.enums.TipoCompromisso;
import br.com.cotiinformatica.services.CompromissoService;
import br.com.cotiinformatica.services.UsuarioService;
import br.com.cotiinformatica.utils.DateUtil;

@Controller
public class CompromissoController {

	@Autowired
	private CompromissoService compromissoService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@RequestMapping("/cadastro-compromisso")
	public ModelAndView cadastroCompromisso() {
		ModelAndView modelAndView = new ModelAndView("agenda/cadastro-compromisso");
		modelAndView.addObject("compromisso", new CadastroCompromissoDTO());
		modelAndView.addObject("tipos", TipoCompromisso.values());
		modelAndView.addObject("prioridades", PrioridadeCompromisso.values());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "cadastrarCompromisso",
			method = RequestMethod.POST)
			public ModelAndView cadastrarCompromisso(CadastroCompromissoDTO compromissoDto) {
			ModelAndView modelAndView = new ModelAndView("agenda/cadastro-compromisso");
			
			try {
				Compromisso compromisso = new Compromisso();
				
				compromisso.setNome(compromissoDto.getNome());
				compromisso.setDataCompromisso(DateUtil.convertDate(compromissoDto.getDataCompromisso()));
				compromisso.setHoraCompromisso(DateUtil.convertTime(compromissoDto.getHoraCompromisso()));
				compromisso.setDescricao(compromissoDto.getDescricao());
				compromisso.setPrioridade(compromissoDto.getPrioridade());
				compromisso.setTipo(compromissoDto.getTipo());
				
				compromissoService.createOrUpdate(compromisso);
				
				modelAndView.addObject("mensagem_sucesso", "Compromisso cadastrado com sucesso");
				
				
			} catch (Exception e) {
				modelAndView.addObject("mensagem_erro", e.getMessage());
			}
			//criando um objeto da classe funcionario..
			modelAndView.addObject("compromisso", new Compromisso());
			//enviando os dados dos ENUMs
			modelAndView.addObject("tipos",TipoCompromisso.values());
			modelAndView.addObject("prioridades",PrioridadeCompromisso.values());
			return modelAndView;
			}	
	
	@RequestMapping("/consulta-compromisso")
	public ModelAndView consultaCompromisso() {
		ModelAndView modelAndView = new ModelAndView("agenda/consulta-compromisso");
		return modelAndView;
		
	}
	
	@RequestMapping("/edicao-compromisso")
	public ModelAndView edicaoCompromisso() {
		ModelAndView modelAndView = new ModelAndView("agenda/edicao-compromisso");
		return modelAndView;
		
	}
	
	
	@RequestMapping("/relatorio-compromisso")
	public ModelAndView relatorioCompromisso() {
		ModelAndView modelAndView = new ModelAndView("agenda/relatorio-compromisso");
		return modelAndView;
	}
	
	
}
