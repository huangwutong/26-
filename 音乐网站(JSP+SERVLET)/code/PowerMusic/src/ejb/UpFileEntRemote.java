package ejb;

import java.io.Serializable;
import java.rmi.RemoteException;
import javax.ejb.*;
/**
 *entity bean remote interface
 */
public interface UpFileEntRemote extends EJBObject{
	String getDbmusicname()throws RemoteException;
}