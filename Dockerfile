FROM ubuntu:latest

# Install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Java
RUN apt-get update \
    && apt-get install -y default-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install Apache Tomcat
ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.75
ENV CATALINA_HOME /opt/tomcat

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar -xf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} \
    && rm apache-tomcat-${TOMCAT_VERSION}.tar.gz



# Start Tomcat
CMD ${CATALINA_HOME}/bin/catalina.sh run

EXPOSE 8080
