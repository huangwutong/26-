package com.xh369.dto;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.HttpServletRequest;

public class ProductBigClass_ActionForm extends ActionForm{

    private Integer id;
    private String bigclassname;

    public String getBigclassname() {
        return bigclassname;
    }

    public Integer getId() {
        return id;
    }

    public void setBigclassname(String bigclassname) {
        this.bigclassname = bigclassname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request){
        return null;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request){
    }
}
