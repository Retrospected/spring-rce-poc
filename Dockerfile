# we are extending everything from tomcat:8.0 image ...
FROM tomcat:9.0
#FROM tomcat
MAINTAINER me
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY ./stupidRumor_war.war /usr/local/tomcat/webapps/
#COPY ./tomcat-users.xml /usr/local/tomcat/conf/
