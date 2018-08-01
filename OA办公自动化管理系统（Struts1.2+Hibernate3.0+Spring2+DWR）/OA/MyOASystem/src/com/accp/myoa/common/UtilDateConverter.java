package com.accp.myoa.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;


public class UtilDateConverter implements Converter {

	@Override
	public Object convert(Class type, Object value) {
		if(value == null) {
			return null;
		}
		if(value instanceof Date) {
			return value;
		}
		
		String dateString = value.toString();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(dateString);
		} catch (ParseException e) {
			sdf = new SimpleDateFormat("yyyy/MM/dd");
			try {
				date = sdf.parse(dateString);
			} catch (ParseException e1) {
				throw new ConversionException(e1);
			}
		}
		
		return date;
	}

}
