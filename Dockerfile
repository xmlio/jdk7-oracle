FROM ubuntu

MAINTAINER Anthony Frey <anthony@requestresponse.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN update-alternatives --display java
ADD java.sh /etc/profile.d/java.sh

CMD ["java", "-version"]

