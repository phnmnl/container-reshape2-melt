FROM artemklevtsov/r-alpine:3.3.1

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.1"
LABEL version="0.1"
LABEL software="reshape2-melt"
LABEL base.image="artemklevtsov/r-alpine:3.3.1"
LABEL description="An R-based depiction for factors and their values in MetaboLights studies"
LABEL website="https://github.com/ISA-tools/container-reshape2-melt"
LABEL documentation="https://github.com/ISA-tools/container-reshape2-melt"
LABEL license="https://github.com/ISA-tools/container-reshape2-melt"
LABEL tags="data management"

RUN R -e "install.packages(c('reshape2','optparse'))"

ADD melt.R /usr/local/bin/melt.R
ADD run_test.sh /usr/local/bin/run_test.sh
RUN chmod a+x /usr/local/bin/melt.R
RUN chmod a+x /usr/local/bin/run_test.sh

ENTRYPOINT ["melt.R"]
