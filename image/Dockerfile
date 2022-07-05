FROM staphb/samtools:1.15
LABEL description="Mitoanalyzer image"
LABEL version="1.0"

RUN apt-get update  && \
    apt-get install -y -q \
    g++ \
    git \
    unzip


COPY mitoAnalyzer /opt/mitoinstall/mitoAnalyzer
WORKDIR /opt/mitoinstall

RUN       cd mitoAnalyzer \
          && rm BaseCoverage \
          && g++ BaseCoverage.cpp -o BaseCoverage \
          && ln -s /opt/mitoinstall/mitoAnalyzer/BaseCoverage /usr/local/bin/BaseCoverage \
          && ln -s /opt/mitoinstall/mitoAnalyzer/fastMitoCalc.pl /usr/local/bin/fastMitoCalc

