FROM linuxserver/baseimage

# set env variables

# specify apt packages to install
ENV BUILD_APTLIST=""
ENV APTLIST=""

# add repositories
#RUN \
#add-apt-repository 'deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu trusty main' && \
#apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy && \

# cleanup 
cd / && \
apt-get purge --remove $BUILD_APTLIST -y && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add some files 
#ADD services/ /etc/service/
#ADD defaults/ /defaults/
#ADD init/ /etc/my_init.d/
#RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh && \

# expose ports
#EXPOSE 443

# set volumes
#VOLUME /config /data
