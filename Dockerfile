FROM plantuml/plantuml-server:jetty as source

FROM jetty:9.4.12-jre8-alpine

USER root

RUN apk add --no-cache graphviz && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing wqy-zenhei && \
    mkdir /var/lib/jetty/webapps/ROOT && \
    echo '<html><head><meta http-equiv="refresh" content="0;URL=/plantuml" /></head><body></body></html>' > /var/lib/jetty/webapps/ROOT/index.html && \
    chown -R jetty:jetty /var/lib/jetty/webapps/ROOT

USER jetty

ENV GRAPHVIZ_DOT=/usr/bin/dot

COPY --from=source /var/lib/jetty/webapps/ROOT.war /var/lib/jetty/webapps/plantuml.war
