FROM tomcat:9.0
MAINTAINER me
COPY ./stupidRumor_war.war /usr/local/tomcat/webapps/
