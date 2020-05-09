FROM gitlab/gitlab-ce:latest

RUN apt update && apt install supervisor -y
COPY config/gitlab.conf /etc/supervisor/conf.d/
RUN mkdir /filebeat; cd /filebeat && \
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.2-linux-x86_64.tar.gz && \
    tar xzvf filebeat-7.6.2-linux-x86_64.tar.gz && \
    rm -rf filebeat-7.6.2-linux-x86_64.tar.gz 
COPY config/filebeat.yml filebeat/filebeat-7.6.2-linux-x86_64/filebeat.yml
COPY config/supervisord.conf /etc/supervisor/supervisord.conf

COPY config/gitlab.rb /etc/gitlab/gitlab.rb

ENTRYPOINT [ "" ]
CMD ["/usr/bin/supervisord", "-n"]