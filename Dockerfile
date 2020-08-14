FROM r-base:3.6.2

RUN apt-get update && \
apt-get install -y \
--no-install-recommends \
ghostscript \
lmodern \
pandoc-citeproc \
qpdf \
r-cran-formatr \
r-cran-ggplot2 \
r-cran-knitr \
r-cran-rmarkdown \
r-cran-runit \
r-cran-testthat \
r-cran-httr \
texinfo \
texlive-fonts-extra \
texlive-fonts-recommended \
texlive-latex-extra \
texlive-latex-recommended \
texlive-luatex \
texlive-plain-generic \
texlive-science \
libmagick++-dev \
libssl-dev \
libcurl4-openssl-dev \
libxml2-dev \
gtk3-nocsd

RUN R -e "install.packages(c(\
'tidyverse', \
'data.table', \
'kableExtra', \
'knitr', \
'summarytools' \
),dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN ln -s /usr/lib/R/site-library/littler/examples/render.r /usr/local/bin

RUN rm -rf /var/lib/apt/lists/* && \
rm -rf /usr/share/locale/ /usr/share/man/ /root/.cache
