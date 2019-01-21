FROM openjdk:8-jdk-alpine
ENV GLASSFISH_HOME /usr/local/glassfish5
ENV PATH $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN apk add --no-cache curl unzip zip inotify-tools

RUN curl -L -o /tmp/glassfish.zip http://download.oracle.com/glassfish/5.0.1/release/glassfish-5.0.1.zip && \
unzip /tmp/glassfish.zip -d /usr/local && \
rm -f /tmp/glassfish.zip

RUN apk del curl unzip zip

EXPOSE 8080
EXPOSE 4848
EXPOSE 8181
WORKDIR /usr/local/glassfish5

CMD asadmin start-domain --verbose
