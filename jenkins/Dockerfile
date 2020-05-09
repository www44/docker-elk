FROM jenkins/jenkins:lts-alpine

USER jenkins
COPY config/jenkins.yml /usr/share/jenkins/ref/
COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/jenkins.yml
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY config/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt 

USER root
RUN apk add supervisor libc6-compat
COPY config/supervisor.ini /etc/supervisor.d/
RUN mkdir /filebeat; cd /filebeat && \
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.2-linux-x86_64.tar.gz && \
    tar xzvf filebeat-7.6.2-linux-x86_64.tar.gz && \
    rm -rf filebeat-7.6.2-linux-x86_64.tar.gz 
COPY config/filebeat.yml filebeat/filebeat-7.6.2-linux-x86_64/filebeat.yml
COPY config/supervisord.conf /etc/supervisord.conf
RUN mkdir /var/log/supervisor

ENTRYPOINT [ "" ]
CMD ["/usr/bin/supervisord", "-n"]

