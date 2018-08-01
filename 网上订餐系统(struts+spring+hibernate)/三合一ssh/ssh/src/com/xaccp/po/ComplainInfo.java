package com.xaccp.po;

public class ComplainInfo  implements java.io.Serializable {


    // Fields    

     private Integer ciId;
     private String ciIdea;
     private UserInfo userInfo;


    // Constructors

	/** default constructor */
    public ComplainInfo() {
    }

	/** minimal constructor */
    public ComplainInfo(Integer ciId) {
        this.ciId = ciId;
    }
    
    /** full constructor */
    public ComplainInfo(Integer ciId, String ciIdea, UserInfo userInfo) {
		super();
		this.ciId = ciId;
		this.ciIdea = ciIdea;
		this.userInfo = userInfo;
	}

   
    // Property accessors

    public Integer getCiId() {
        return this.ciId;
    }
    
    public void setCiId(Integer ciId) {
        this.ciId = ciId;
    }

    public String getCiIdea() {
        return this.ciIdea;
    }
    
    public void setCiIdea(String ciIdea) {
        this.ciIdea = ciIdea;
    }

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
}