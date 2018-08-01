package sys.dao.bean;


public class Position implements java.io.Serializable
{
	private static final long serialVersionUID = 5527971156159859710L;
	//职位ID
	private Integer positionid;
	//职位
	private String job;
	public String getJob()
	{
		return job;
	}
	public void setJob(String job)
	{
		this.job = job;
	}
	public Integer getPositionid()
	{
		return positionid;
	}
	public void setPositionid(Integer positionid)
	{
		this.positionid = positionid;
	}
}