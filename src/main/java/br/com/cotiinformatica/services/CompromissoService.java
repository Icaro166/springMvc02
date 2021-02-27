package br.com.cotiinformatica.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import br.com.cotiinformatica.entities.Compromisso;
import br.com.cotiinformatica.interfaces.ICompromissoRepository;

public class CompromissoService {

	@Autowired
	private ICompromissoRepository compromissoRepository;

	public void createOrUpdate(Compromisso compromisso) throws Exception {
		compromissoRepository.save(compromisso);
	}

	public void delete(Compromisso compromisso) throws Exception {
		compromissoRepository.delete(compromisso);
	}
	
	public List<Compromisso> findAll() throws Exception{
		return(List<Compromisso>) compromissoRepository.findAll();
	}
	
	public Compromisso findById(Integer id) throws Exception{
		return compromissoRepository.findById(id).get();
		
	}
	
	public List<Compromisso> findaByDatas(Date dataMin, Date dataMax) throws Exception{
		return compromissoRepository.findByDatas(dataMin, dataMax);
	}
}
