#!/bin/bash

jbossHome=$1
shift

jacorb="${jbossHome}/modules/system/layers/base/org/jacorb/main/jacorb-2.3.2.redhat-6.jar:${jbossHome}/modules/system/layers/base/org/jboss/as/jacorb/main/jboss-as-jacorb-7.5.21.Final-redhat-1.jar"
slf4j="${jbossHome}/modules/system/layers/base/org/slf4j/main/slf4j-api-1.7.2.redhat-4.jar:${jbossHome}/modules/system/layers/base/org/slf4j/impl/main/slf4j-jboss-logmanager-1.0.3.GA-redhat-1.jar"
client="target/testiiop.jar:${jbossHome}/bin/client/jboss-cli-client.jar:${jbossHome}/bin/client/jboss-client.jar"

cp="${client}:${jacorb}:${slf4j}:${wfly_jacorb}"

JAVA_OPTS="-Djava.security.policy=$PWD/java.policy -Djava.security.auth.login.config=$PWD/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true -Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB -Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.jboss.as.jacorb.csiv2.SASClientInitializer" 

echo "java $JAVA_OPTS -cp $cp org.jboss.test.iiop.client.JDKClient $*"

java $JAVA_OPTS -cp $cp org.jboss.test.iiop.client.JDKClient $*
