# testiiop6
Jacob EJB sample with security

# Add the test user
$JBOSS_HOME/bin/add-user.sh -a -u ejbtest -p ejbtest@123 --role ejbtest

# Deploy

cp target/testiiop.jar $JBOSS_HOME/standalone/deployments/

# Start JBoss Full profile
$JBOSS_HOME/bin/standalone.sh -c standalone-full.xml

# To run the client
-Djava.security.policy=/path/java.policy -Djava.security.auth.login.config=/path/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true -Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB -Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.jboss.as.jacorb.csiv2.SASClientInitializer

run-6.2.21.sh /path/to/jboss-eap-6.4.21
