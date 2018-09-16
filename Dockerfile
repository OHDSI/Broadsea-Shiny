FROM rocker/shiny

MAINTAINER Lee Evans - www.ltscomputingllc.com

RUN apt-get update && apt-get install -y openjdk-8-jdk liblzma-dev libbz2-dev libicu-dev && R CMD javareconf

RUN R -e "install.packages( \
 c( \
  'rJava', \
  'SqlRender', \
  'shinydashboard', \
  'DT', \
  'pROC', \
  'EmpiricalCalibration' \
 ), \
 repos='http://cran.rstudio.com/', \
) "
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_2.2.1.tar.gz', repos=NULL, type='source') "
