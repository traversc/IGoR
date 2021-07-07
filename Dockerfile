# TO CREATE IMAGE docker build -t digor:dev .
FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y build-essential git autotools-dev
 
# download doxygen and asciidoctor
RUN apt-get install -y texlive-base texlive-latex-recommended texlive-latex-extra
RUN apt-get install -y asciidoctor doxygen
RUN apt-get install -y texlive-font-utils
RUN apt-get install -y autoconf 
RUN apt-get install -y libtool 

WORKDIR /programs

RUN git clone https://github.com/statbiophys/IGoR.git 
WORKDIR /programs/IGoR 

RUN ./autogen.sh
RUN ./configure && make && make install
RUN rm -r /programs/IGoR

# WORKDIR /programs
# RUN git clone https://github.com/statbiophys/pygor3.git
# WORKDIR /programs/pygor3
# RUN apt-get install -y python-pip
# RUN pip install pygor3

RUN useradd -ms /bin/bash ceor
RUN mkdir /igor_data
RUN chmod 777 /igor_data
RUN chown ceor:ceor /igor_data
USER ceor
VOLUME /igor_data
WORKDIR /igor_data

ENTRYPOINT ["igor"] 

#CMD ["ls", "/igor_data"]

#ENTRYPOINT ["pygor"]
