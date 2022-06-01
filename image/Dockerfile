FROM staphb/samtools:1.15
LABEL description="Mitoanalyzer image"
LABEL version="1.0"

RUN apt-get update  && \
    apt-get install -y -q \
    g++ \
    git \
    unzip

WORKDIR /opt/mitoinstall
RUN  pwd && git clone https://github.com/HSGU-NIA/mitoAnalyzer \
             && cd mitoAnalyzer \
             && pwd \
             && unzip fastMitoCalc.zip \
             && rm BaseCoverage \
             && g++ BaseCoverage.cpp -o BaseCoverage \
             && ln -s /opt/mitoinstall/mitoAnalyzer/BaseCoverage /usr/local/bin/BaseCoverage \
             && ln -s /opt/mitoinstall/mitoAnalyzer/fastMitoCalc.pl /usr/local/bin/fastMitoCalc

