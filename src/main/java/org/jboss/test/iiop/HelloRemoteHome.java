package org.jboss.test.iiop;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface HelloRemoteHome extends EJBHome
{
   public HelloRemote create() throws RemoteException;
}
