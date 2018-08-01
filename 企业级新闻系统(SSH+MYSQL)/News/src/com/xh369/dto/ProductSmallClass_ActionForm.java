package com.xh369.dto;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public class ProductSmallClass_ActionForm extends ActionForm{

    private Integer id;
    private String smallclassname;
    private ProductBigClass productbigclass;

    public Integer getId() {
        return id;
    }

    public ProductBigClass getProductbigclass() {
        return productbigclass;
    }

    public String getSmallclassname() {
        return smallclassname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setProductbigclass(ProductBigClass productbigclass) {
        this.productbigclass = productbigclass;
    }

    public void setSmallclassname(String smallclassname) {
        this.smallclassname = smallclassname;
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request){
        return null;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request){
    }
}
