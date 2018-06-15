FROM r-base:latest

LABEL description="A container for running reshape2 R package."
LABEL software.version="3.4.3-1xenial0"
LABEL version="0.3"
LABEL base.image="r-base:latest"
LABEL website="https://github.com/phnmnl/container-r-reshape2"
LABEL documentation="https://github.com/phnmnl/container-r-reshape2"
LABEL license="https://github.com/phnmnl/container-r-reshape2/blob/develop/License.txt"
LABEL tags="Metadata"



RUN R -e "install.packages(c('reshape2','plyr','ggplot2','RcolorBrewer','scales','grid'), repos = 'http://cran.us.r-project.org', dependencies=TRUE)" > /tmp/packages.R \
    && Rscript /tmp/packages.R

# create an R user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

WORKDIR $HOME
USER user

# set the command
CMD ["R"]


# Add test script
ADD runTest1.R /usr/local/bin/runTest1.R