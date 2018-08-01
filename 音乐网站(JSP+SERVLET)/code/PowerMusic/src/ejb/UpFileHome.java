package ejb;

import java.io.Serializable;
import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.io.*;

/**
 *@有状态SessionBean的Home接口
 */
public interface UpFileHome extends EJBHome {
	UpFileRemote Create(String finalpath,String musicname,String musictype,String singername) 
				throws CreateException,RemoteException;

}
