FROM ubuntu:15.10

MAINTAINER ishiidaichi

# necessary tools
RUN apt-get upgrade -y
RUN apt-get update -y
RUN apt-get install -y build-essential libc6 libpcre3 libpcre3-dev libpcrecpp0v5 libssl-dev

#php5.6 install
RUN apt-get install -y software-properties-common
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu wily main" > /etc/apt/sources.list.d/ondrej-php5-5_6-willy.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get install -y php5

#php setup
RUN apt-get install -y php5-dev php5-cli php-pear
RUN apt-get install -y curl php5-curl
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y imagemagick php5-imagick
RUN pecl install mongo
RUN echo "extension=mongo.so" >> /etc/php5/cli/conf.d/30-mongo.ini

##install phalcon php
RUN apt-get install -y git-core gcc autoconf
RUN git clone git://github.com/phalcon/cphalcon.git
RUN cd cphalcon/build && ./install
RUN echo "extension=phalcon.so" >> /etc/php5/cli/conf.d/30-phalcon.ini

#mongodb local
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update -y
RUN apt-get install -y mongodb-org-shell

# make cli app directory
RUN mkdir /var/cli

# Add files
EXPOSE 80 443

VOLUME ["/var/cli"]

CMD ["/bin/bash"]
