FROM staphb/samtools:1.15
LABEL description="Mitoanalyzer image with fastMitoCalc"
LABEL image="mitoanalyzer"
LABEL version="0.0.3a"

RUN apt-get update  && \
    apt-get install -y -q \
    g++ \
    git \
    unzip


COPY fastMitoCalc.patch /opt/mitoinstall/
WORKDIR /opt/mitoinstall

RUN       git clone https://github.com/HSGU-NIA/mitoAnalyzer \
          && cd mitoAnalyzer \
          && unzip fastMitoCalc.zip \
          && rm BaseCoverage \
          && g++ BaseCoverage.cpp -o BaseCoverage \
          && patch fastMitoCalc.pl ../fastMitoCalc.patch \
          && ln -s /opt/mitoinstall/mitoAnalyzer/BaseCoverage /usr/local/bin/BaseCoverage \
          && ln -s /opt/mitoinstall/mitoAnalyzer/fastMitoCalc.pl /usr/local/bin/fastMitoCalc

