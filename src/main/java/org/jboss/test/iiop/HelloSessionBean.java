package org.jboss.test.iiop;

import javax.annotation.Resource;
import javax.annotation.security.RolesAllowed;
import javax.ejb.RemoteHome;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;

@Stateless
@RemoteHome(HelloRemoteHome.class)
public class HelloSessionBean
{
   @RolesAllowed("ejbtest")
   public String hello(String name)
   {
			System.out.println("hello called for name: " + name);
      return "Hello " + name;
   }
}
