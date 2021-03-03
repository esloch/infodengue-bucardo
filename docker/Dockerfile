FROM mdillon/postgis:9.6


RUN apt-get -qq update --yes \
    && apt-get -qq install --yes --no-install-recommends \
    build-essential debconf git make wget\
    ca-certificates locales gnupg2 sudo vim \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -qq update --yes \
&& apt-get -qq install --yes libdbix-safe-perl libdbd-pg-perl libboolean-perl postgresql-plperl-9.6

RUN mkdir -p /var/log/bucardo /var/run/bucardo \
&& chown -R postgres:postgres /var/log/bucardo /var/run/bucardo

ADD docker/bucardo_setup/* /docker-entrypoint-initdb.d/

ADD docker/.bucardorc /root/.bucardorc
RUN wget http://bucardo.org/downloads/Bucardo-5.5.0.tar.gz\
&& tar -xzvf Bucardo-5.5.0.tar.gz  \
&& mv Bucardo-5.5.0 /Bucardo \
&& cd /Bucardo \
&& pwd \
&& perl Makefile.PL \
&& apt install make \
&& make \
&& make install

WORKDIR /Bucardo

EXPOSE 5432

# CMD [ "entrypoint.sh" ]
