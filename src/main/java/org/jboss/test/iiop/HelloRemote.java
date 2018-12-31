package org.jboss.test.iiop;

import java.rmi.RemoteException;

import javax.ejb.EJBObject;

public interface HelloRemote extends EJBObject
{
   String hello(String name) throws RemoteException;
}
