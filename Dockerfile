FROM plantuml/plantuml-server:jetty-v1.2023.13

ENV BASE_URL=plantuml

USER root

RUN apt update && \
    apt install -y fonts-wqy-zenhei && \
    mkdir /var/lib/jetty/webapps/ROOT && \
    echo '<html><head><meta http-equiv="refresh" content="0;URL=/plantuml" /></head><body></body></html>' > /var/lib/jetty/webapps/ROOT/index.html && \
    chown -R jetty:jetty /var/lib/jetty/webapps/ROOT && \
    mv /var/lib/jetty/webapps/ROOT.xml /var/lib/jetty/webapps/plantuml.xml

USER jetty
