FROM neo4j:5.7.0
RUN apt update \
    && apt install -y python3 \
    && ln -s /usr/bin/python3 /usr/bin/python
RUN apt update \
    && apt install -y apache2 \
    && sed -i -e 's:^Listen.*$:Listen 8080:' /etc/apache2/ports.conf \
    && sed -i -e '/VirtualHost/ s:80:8080:' /etc/apache2/sites-enabled/000-default.conf \
    && sed -i -e '/DocumentRoot/ s:html:idb_viewer:' /etc/apache2/sites-enabled/000-default.conf
COPY --chown=neo4j:neo4j ./idb_init /idb_init/
COPY --chown=neo4j:neo4j ./idb /idb/
COPY --chown=neo4j:neo4j ./idb_viewer /var/www/idb_viewer/
ENV EXTENSION_SCRIPT=/idb_init/init_wrapper.sh

