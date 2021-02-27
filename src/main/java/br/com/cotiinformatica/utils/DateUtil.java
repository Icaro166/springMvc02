package br.com.cotiinformatica.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
	public static Date convertDate(String date) {
		
		int ano = Integer.parseInt(date.substring(0, 4));
		int mes = Integer.parseInt(date.substring(5, 7));
		int dia = Integer.parseInt(date.substring(8, 10));
		
		Calendar result = new GregorianCalendar(ano, mes -1, dia);
		return result.getTime();
	}
	
	public static Date convertTime(String time) {
		int hora = Integer.parseInt(time.substring(0,2));
		int minuto= Integer.parseInt(time.substring(3,5));
		
		Calendar result = new GregorianCalendar();
		result.set(Calendar.HOUR, hora);
		result.set(Calendar.MINUTE, minuto);
		
		return result.getTime();
		
	}
	
	
	
}
