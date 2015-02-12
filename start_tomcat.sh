#! /bin/bash
service ssh start
$LIFERAY_HOME/tomcat-7.0.42/bin/startup.sh
tail -f $LIFERAY_HOME/tomcat-7.0.42/logs/catalina.out
