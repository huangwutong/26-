
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.WeekDiary;


public class WeekDiaryForm extends ActionForm {
	private WeekDiary weekDiary;
	
	public WeekDiaryForm(){
		weekDiary=new WeekDiary();
	}

	public WeekDiary getWeekDiary() {
		return weekDiary;
	}

	public void setWeekDiary(WeekDiary weekDiary) {
		this.weekDiary = weekDiary;
	}
	
}
	
