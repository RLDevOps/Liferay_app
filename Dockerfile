FROM ubuntu


RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install openssh-server

RUN apt-get -y install openjdk-7-jdk

ADD liferay-portal-tomcat-6.2-ce-ga3-20150103155803016.zip /opt/liferayApp/

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN apt-get -y install unzip && unzip /opt/liferayApp/liferay-portal-tomcat-6.2-ce-ga3-20150103155803016.zip -d /opt/liferayApp/

ENV LIFERAY_HOME /opt/liferayApp/liferay-portal-6.2-ce-ga3/
#RUN cd $LIFERAY_HOME && rm -f portal-ext.properties portal-local.gghhcsb.com.properties portal-setup-wizard.properties
ADD portal-ext.properties /opt/liferayApp/liferay-portal-6.2-ce-ga3/portal-ext.properties
#ADD portal-local.gghhcsb.com.properties $LIFERAY_HOME/portal-local.gghhcsb.com.properties
ADD portal-setup-wizard.properties $LIFERAY_HOME/portal-setup-wizard.properties

ADD start_tomcat.sh /usr/bin/start_tomcat.sh
#VOLUME ["/opt/liferay-home", "/opt/liferayApp/liferay-portal-tomcat-6.1-ee-ga3-sp1/liferay-portal-6.1-ee-ga3-sp1/"]
RUN chmod 755 /usr/bin/start_tomcat.sh
EXPOSE 8080
CMD /usr/bin/start_tomcat.sh
