FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase:v3.4.1-1xenial0_cv0.2.12

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.1"
LABEL version="0.1"
LABEL software="reshape2-melt"
LABEL base.image="phnmnl/rbase:v3.4.1-1xenial0_cv0.2.12"
LABEL description="An R-based depiction for factors and their values in MetaboLights studies"
LABEL website="https://github.com/ISA-tools/container-reshape2-melt"
LABEL documentation="https://github.com/ISA-tools/container-reshape2-melt"
LABEL license="https://github.com/ISA-tools/container-reshape2-melt"
LABEL tags="data management"

RUN apt-get -y update && apt-get -y --no-install-recommends install r-base-dev libssl-dev \
                                    libcurl4-openssl-dev git \
                                    libssh2-1-dev r-cran-ncdf4 && \
    echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site && \
    R -e "install.packages(c('devtools', 'optparse','reshape2','ggplot2'))" && \
    R -e 'library(devtools)' && \
    apt-get purge -y git r-base-dev libssl-dev libcurl4-openssl-dev libssh2-1-dev && \
    apt-get clean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

ADD melt.R /usr/local/bin/melt.R
ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/melt.R

ENTRYPOINT ["melt.R"]
