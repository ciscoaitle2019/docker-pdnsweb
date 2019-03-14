FROM ubuntu:16.04

WORKDIR /usr/local/src
ADD . /usr/local/src/

RUN apt-get -qq update 
RUN apt-get -y install vim \
	locales \
	python-software-properties software-properties-common 

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y \
	&& apt-get update \ 
	&& apt-get install -y php5.6 apache2 php5.6-mysql


RUN chmod 755 /usr/local/src/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/src/docker-entrypoint.sh"]





