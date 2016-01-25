FROM ubuntu
MAINTAINER "Scott Collier" <scollier@redhat.com>

RUN sudo apt-get -y update
RUN sudo apt-get clean all
RUN sudo apt-get -y install net-tools
RUN sudo apt-get -y install apache2
RUN sudo apt-get clean all
RUN /etc/init.d/apache2 start
RUN echo "Apache" >> /var/www/html/index.html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

CMD ["/run-apache.sh"]
