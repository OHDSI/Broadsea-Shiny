FROM rocker/shiny:4.2.3

MAINTAINER Lee Evans - www.ltscomputingllc.com

ARG CRAN=https://packagemanager.posit.co/cran/__linux__/focal/latest
ARG JAVA_PARAMS=-Xss100m

# Sets CRAN to latest (or user specified) version
RUN echo "options(repos=c(CRAN='$CRAN'))" >> /root/.Rprofile
RUN echo "options(java.parameters = '$JAVA_PARAMS')" >> /root/.Rprofile

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk liblzma-dev libbz2-dev libicu-dev libssl-dev libxml2-dev \
    texlive-science texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra \
    libtiff-dev libjpeg-dev libnlopt-dev cmake \
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
  'shinyjs', \
  'shinyFiles', \
  'auth0', \
  'rhandsontable', \
  'shinyBS', \
  'shinythemes', \
  'rlist', \
  'uuid', \
  'VennDiagram', \
  'zeallot', \
  'reshape2', \
  'readr', \
  'aws.s3', \
  'RSQLite', \
  'aws.ec2metadata', \
  'shiny.i18n', \
  'pool', \
  'reshape', \
  'ggiraph', \
  'checkmate', \
  'purrr', \
  'RJSONIO', \
  'diffr', \
  'remotes', \
  'future', \
  'UpSetR' \
 ) \
) "

RUN R -e "install.packages(pkgs = 'https://cran.r-project.org/src/contrib/Archive/googledrive/googledrive_0.1.3.tar.gz') "

RUN R -e "install.packages( \
 c( \
  'ggrepel', \
  'epitools', \
  'extrafont', \
  'cowplot', \
  'jpeg', \
  'survminer', \
  'reactable', \
  'markdownInput', \
  'ggh4x', \
  'vctrs' \
 ), \
) "

RUN R -e "remotes::install_github('OHDSI/CirceR')" && \
    R -e "remotes::install_github('OHDSI/Capr', upgrade='always')"

RUN R -e "remotes::install_github('OHDSI/ROhdsiWebApi', upgrade='always')" && \
    R -e "remotes::install_github('OHDSI/CohortDiagnostics', upgrade='always')" && \
    R -e "remotes::install_github('OHDSI/OhdsiSharing', upgrade='always')" && \
    R -e "remotes::install_github('OHDSI/OhdsiShinyModules', upgrade='always')" && \
    R -e "remotes::install_github('OHDSI/ShinyAppBuilder', upgrade='always')" && \
    R -e "remotes::install_github('OHDSI/ResultModelManager', upgrade='always')" 

RUN R -e "install.packages( \
 c( \
  'tsibble', \
  'feasts', \
  'fable' \
 ), \
) "
