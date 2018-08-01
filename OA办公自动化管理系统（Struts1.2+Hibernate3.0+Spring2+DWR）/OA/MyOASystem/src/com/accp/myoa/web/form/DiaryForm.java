
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Diary;


public class DiaryForm extends ActionForm {
	private Diary diary;
	
	public DiaryForm(){
		diary=new Diary();
	}

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}
	
}
	
