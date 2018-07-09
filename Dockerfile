FROM rocker/shiny

MAINTAINER Lee Evans - www.ltscomputingllc.com

RUN apt-get update && apt-get install -y default-jdk && R CMD javareconf
RUN R -e "install.packages( \
 c( \
  'rJava', \
  'SqlRender', \
  'ggplot2', \
  'shinydashboard', \
  'DT', \
  'pROC', \
  'EmpiricalCalibration' \
 ), \ 
 repos='http://cran.rstudio.com/', \
) "
