FROM tomcat:8.0.20-jre8
#COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
COPY /home/ubuntu/docker_slave/Applications/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
