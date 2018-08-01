package com.xh369.dto;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.HttpServletRequest;

public class SmallClass_ActionForm extends ActionForm {

    private Integer id;
    private String smallclassname;
    private BigClass bigclass;

    public BigClass getBigclass() {
        return bigclass;
    }

    public void setBigclass(BigClass bigclass) {
        this.bigclass = bigclass;
    }

    public void setSmallclassname(String smallclassname) {
        this.smallclassname = smallclassname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getSmallclassname() {
        return smallclassname;
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request){
        return null;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {
    }
}
