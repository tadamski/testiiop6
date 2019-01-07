#!/bin/bash

jbossHome=$1
shift
modules="${jbossHome}/modules/system/layers/base"

picketbox=${modules}/org/picketbox/main/picketbox-5.0.3.Final-redhat-3.jar:${modules}/org/picketbox/main/picketbox-commons-1.0.0.final-redhat-5.jar
orb=${modules}/javax/orb/api/main/openjdk-orb-8.0.8.Final-redhat-1.jar:${modules}/org/jboss/as/jacorb/main/wildfly-jacorb-7.1.5.GA-redhat-00002.jar

slf4j="${jbossHome}/modules/system/layers/base/org/slf4j/main/slf4j-api-1.7.2.redhat-4.jar:${jbossHome}/modules/system/layers/base/org/slf4j/impl/main/slf4j-jboss-logmanager-1.0.3.GA-redhat-1.jar"
client="target/testiiop.jar:${jbossHome}/bin/client/jboss-cli-client.jar:${jbossHome}/bin/client/jboss-client.jar"

cp="${client}:${orb}:${slf4j}:${picketbox}"

JAVA_OPTS="-Djava.security.policy=$PWD/java.policy -Djava.security.auth.login.config=$PWD/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true"

#JAVA_OPTS="$JAVA_OPTS -Dorg.omg.CORBA.ORBClass=com.sun.corba.se.spi.orb.ORB -Dorg.omg.CORBA.ORBSingletonClass=com.sun.corba.se.impl.orb.ORBSingleton"

# These classes do not exist in EAP 7 which uses OpenJDK ORB
#-Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB -Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.jboss.as.jacorb.csiv2.SASClientInitializer" 

echo "java $JAVA_OPTS -cp $cp org.jboss.test.iiop.client.JDKClient $*"

java $JAVA_OPTS -cp $cp org.jboss.test.iiop.client.JDKClient $*
