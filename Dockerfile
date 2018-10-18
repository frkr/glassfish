FROM openjdk:8-jdk-alpine
ENV GLASSFISH_HOME /usr/local/glassfish4
ENV PATH $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN apk add --no-cache curl unzip zip inotify-tools

RUN curl -L -o /tmp/glassfish-4.1.zip http://download.java.net/glassfish/4.1.2/release/glassfish-4.1.2.zip && \
unzip /tmp/glassfish-4.1.zip -d /usr/local && \
rm -f /tmp/glassfish-4.1.zip

RUN apk del curl unzip zip

EXPOSE 8080
EXPOSE 4848
EXPOSE 8181
WORKDIR /usr/local/glassfish4

CMD asadmin start-domain --verbose