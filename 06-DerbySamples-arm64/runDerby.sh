#!/bin/sh
# Apache Derby samples startup script
# The assumption is that this script will be run at container startup
# Several environment variables are set/updated as part of container startup. These are:
#
echo "Environment variables on startup are:"
echo "JAVA_HOME=${JAVA_HOME}"  
echo "DERBY_VERSION=${DERBY_VERSION}"
echo "DERBY_INSTALL=${DERBY_INSTALL}"
echo "DERBY_HOME=${DERBY_HOME}"
echo "DERBY_LIB=${DERBY_LIB}"
echo "DERBY_BIN=${DERBY_BIN}"
echo "DERBY_DATA=${DERBY_DATA}"
echo "DERBY_DBS=${DERBY_DBS}"
echo "PATH=${PATH}"
echo "Working directory: `pwd` "

CLASSPATH=$DERBY_LIB/derbyshared.jar:$DERBY_LIB/derby.jar:$DERBY_LIB/derbynet.jar:$DERBY_LIB/derbytools.jar:$DERBY_LIB/derbyoptionaltools.jar:$DERBY_LIB/derbyclient.jar:${CLASSPATH}

export CLASSPATH
echo "CLASSPATH=${CLASSPATH}"
echo "------------------------------"
#
# Since this derby instance is for samples, we'll only copy the samples if they have not been copied there before
# samples are in DERBY_DBS environment variable that was set as part of container startup
# a simple test of the existance of the databases directory does not exists then we install

if [ ! -e ${DERBY_DBS} ] 
then
   echo "Installing Samples "
   cd ${DERBY_DATA}; tar -xzf databases.tgz 
fi

echo "Launching derby network server"

java -Xms32m -Xmx4096m -Dderby.system.home="${DERBY_DBS}" org.apache.derby.drda.NetworkServerControl start -h 0.0.0.0 -noSecurityManager
