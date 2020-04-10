FROM mysql:5.6

MAINTAINER @fvlgnn

ARG DB_USER
ARG DB_GROUP

#NOTE Uncomment below for enable mysql logs
#RUN sed -i "s/#log-error/log-error/g" /etc/mysql/mysql.conf.d/mysqld.cnf

RUN usermod -u 1000 ${DB_USER} \
    && groupmod -g 1000 ${DB_GROUP}

#NOTE use --collation-server=utf8mb4_unicode_ci if you need NOT LATIN LANGUAGE
CMD ["--ignore-db-dir=lost+found", "--explicit_defaults_for_timestamp","--character-set-server=utf8mb4", "--collation-server=utf8mb4_general_ci", "--skip-character-set-client-handshake"]

