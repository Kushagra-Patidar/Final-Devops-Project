# Use an official Tomcat runtime as a parent image
#FROM tomcat:9.0-jre8
# Create application director
#RUN mkdir /usr/local/tomcat
# Copy the war file to the webapps directory
#RUN cd /usr/local/tomcat/
#RUN cp /var/lib/jenkins/workspace/Project-Docker/target/ABCtechnologies-1.0  .
# Expose the default Tomcat port
#ADD **/*.war /usr/local/tomcat/webapps
#EXPOSE 8080
# Start Tomcat
#CMD ["catalina.sh", "run"]


# Use an official Tomcat runtime as a parent image
#FROM tomcat:9.0-jre8
# Create application directory
#RUN mkdir -p /usr/local/tomcat/webapps
#COPY  /var/lib/jenkins/workspace/Project-Docker/target/ABCtechnologies-1.0.war  /usr/local/tomcat/webapps/
# Copy the war file to the webapps directory
#EXPOSE 8080
# Expose the default Tomcat port
# Start Tomcat
#CMD ["catalina.sh", "run"]






FROM ubuntu:18.04 
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget vim curl
RUN mkdir /usr/local/tomcat
ADD https://downloads.apache.org/tomcat/tomcat-9/v9.0.84/bin/apache-tomcat-9.0.84.tar.gz  /tmp/apache-tomcat-9.0.84.tar.gz
RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.84.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.84/* /usr/local/tomcat/
ADD **/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
