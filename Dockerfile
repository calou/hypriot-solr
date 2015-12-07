FROM hypriot/rpi-java 

ENV SOLR_VERSION 5.3.1
ENV SOLR solr-$SOLR_VERSION

RUN apt-get update && apt-get install -y unzip && apt-get clean all

ADD http://mirrors.gigenet.com/apache/lucene/solr/$SOLR_VERSION/$SOLR.tgz /tmp/$SOLR.tgz
RUN mkdir -p /opt \
 && gzip -dc /tmp/$SOLR.tgz | tar -C /opt -x \
 && ln -sf /opt/$SOLR /opt/solr \
 && rm /tmp/$SOLR.tgz

RUN apt-get -y remove unzip && apt-get autoremove && apt-get clean all

EXPOSE 8983

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh

WORKDIR /opt/solr

ENTRYPOINT ["/entrypoint.sh"]
