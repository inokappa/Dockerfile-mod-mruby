FROM inokappa/wheezy-7.2-basic:latest
MAINTAINER Yohei Kawahara "inokara@gmail.com"

RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y git
RUN apt-get install -y apache2-prefork-dev
RUN apt-get install -y rake
RUN apt-get install -y bison
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libhiredis-dev
RUN apt-get install -y libmarkdown2-dev
RUN apt-get install -y libcap-dev
RUN apt-get install -y libcgroup-dev

RUN cd /root/ && git clone git://github.com/matsumoto-r/mod_mruby.git
RUN chmod 755 /root/mod_mruby/build.sh
RUN cd /root/mod_mruby/ && ./build.sh
RUN echo "AddHandler mruby-script .rb" >> /etc/apache2/mods-enabled/mruby.load
RUN cp /root/mod_mruby/test/test.rb /var/www/
