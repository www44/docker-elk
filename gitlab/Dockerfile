FROM gitlab/gitlab-ce:latest

RUN apt update && apt install supervisor -y
COPY config/gitlab.conf /etc/supervisor/conf.d/
RUN mkdir /filebeat; cd /filebeat && \
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.2-linux-x86_64.tar.gz && \
    tar xzvf filebeat-7.6.2-linux-x86_64.tar.gz && \
    rm -rf filebeat-7.6.2-linux-x86_64.tar.gz 
RUN mkdir /heartbeat; cd /heartbeat && \
    curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.7.0-linux-x86_64.tar.gz && \
    tar xzvf heartbeat-7.7.0-linux-x86_64.tar.gz && \
    rm -rf heartbeat-7.7.0-linux-x86_64.tar.gz 
COPY config/filebeat.yml filebeat/filebeat-7.6.2-linux-x86_64/filebeat.yml
COPY config/heartbeat.yml heartbeat/heartbeat-7.7.0-linux-x86_64/heartbeat.yml

COPY config/gitlab.rb /etc/gitlab/gitlab.rb
COPY config/cron_restart.sh /
RUN chmod 0755 /cron_restart.sh


ENTRYPOINT [ "" ]
CMD ["/usr/bin/supervisord", "-n"]