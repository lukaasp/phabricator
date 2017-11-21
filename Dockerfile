FROM ubuntu:14.04
MAINTAINER Lukaasp 1.0

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        apache2 \
        php5 \
        php5-mysql \
        mysql-client \
        php5-gd \
        php5-dev \
        php5-curl \
        php-apc \
        php5-cli \
        dpkg-dev \
        sendmail \
        git-core \
        vim \
        curl \
        python-pygments \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD startup.sh /opt/startup.sh
ADD phabricator-site.conf /etc/apache2/sites-available/phabricator-site.conf
RUN mkdir -p /opt/code_review/files && chown -R www-data:www-data /opt/code_review/files && mkdir -p /etc/apache2/logs \
        && ln -s /usr/lib/git-core/git-http-backend /usr/local/bin/git-http-backend \
        && chmod +x /opt/startup.sh \
        && rm -rf /etc/apache2/sites-enabled/* \
        && a2ensite phabricator-site \
        && a2enmod rewrite \
        && sed -i 's/8M/4G/g' /etc/php5/apache2/php.ini && sed -i 's/2M/4G/g' /etc/php5/apache2/php.ini
ENV MYSQL_HOST localhost
ENV MYSQL_USER admin
ENV MYSQL_PASS password
ENV PHABRICATOR_URL http://127.0.0.1

RUN cd /opt/code_review && git clone git://github.com/facebook/libphutil.git && git clone git://github.com/facebook/arcanist.git && git clone git://github.com/facebook/phabricator.git
WORKDIR /opt

VOLUME ["/var/repo","/opt/code_review/phabricator/conf/local"]

EXPOSE 80

CMD ["./startup.sh"]
