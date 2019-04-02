FROM mongo:4

RUN apt-get update && apt-get -y install cron awscli

ENV CRON_TIME="0 0 * * *" 
ENV TZ=UTC 
ENV CRON_TZ=UTC

ADD run.sh /run.sh
CMD /run.sh
