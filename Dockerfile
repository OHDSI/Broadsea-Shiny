FROM rocker/shiny

MAINTAINER Lee Evans - www.ltscomputingllc.com

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk liblzma-dev libbz2-dev libicu-dev libssl-dev \
    texlive-science texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra \
    && R CMD javareconf

RUN R -e "install.packages( \
 c( \
  'openssl', \
  'httr', \
  'plotly', \
  'shinycssloaders', \
  'rJava', \
  'SqlRender', \
  'shinydashboard', \
  'DT', \
  'pROC', \
  'DatabaseConnector', \
  'EmpiricalCalibration', \
  'ggplot2', \
  'shinyWidgets', \
  'visNetwork', \
  'googledrive', \
  'shinyjs', \
  'shinyFiles' \
 ), \
 repos='http://cran.rstudio.com/', \
) "
