# This is builds an image with the dx compiler to compile 
# the WDL workflow to a dnaNexus workflow.
FROM debian:latest
LABEL description="DNANexus dx compiler compiler with"
LABEL version="2.10.2"

RUN apt-get update -y -q  && \
    apt-get upgrade -y -q && \
    apt-get install -y -q \
        python3 \
        pip \
        openjdk-17-jdk-headless \
        wget && \
    pip install dxpy

RUN useradd -m compile && mkdir /opt/dxCompiler

WORKDIR /opt/dxCompiler

RUN  wget https://github.com/dnanexus/dxCompiler/releases/download/2.10.2/dxCompiler-2.10.2.jar 

WORKDIR /usr/local/bin

RUN  echo '#!/bin/bash\n java -jar /opt/dxCompiler/dxCompiler-2.10.2.jar $@ \n' > dxCompiler && \
     chmod a+x dxCompiler

USER compile
WORKDIR /home/compile
