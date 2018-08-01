package com.ponyjava.common.struts2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class SimpleDateConverter extends StrutsTypeConverter {
	private static final SimpleDateFormat format = new SimpleDateFormat(
			"yyyy-MM-dd");

	@Override
	@SuppressWarnings("unchecked")
	public Object convertFromString(Map context, String[] values, Class toClass) {
		String date = values[0];
		try {
			return format.parse(date);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public String convertToString(Map context, Object o) {
		Date date = (Date) o;
		return format.format(date);
	}

}
