2020.01.16
Lu Yi (lu.yi@ki.se)

# Aim: to run R markdown script in a docker container


## 1. pull the R docker w Rmarkdown and tidyverse and a few other R packages installed
docker pull azab/rmd-tidyverse:test

## 2. download input files & put in a local folder (LOCAL_PATH below)
2.1 the Rmd script: tryggve.query1.v1.Rmd 
2.2 toy dataset: fakedata

## 3. execute the docker, and mount the local folder into docker (INPUT folder below)
docker run -it -v LOCAL_PATH:/INPUT azab/rmd-tidyverse:test 

e.g.
docker run -it -v /Users/luyi/CloudStation/WORK_2020/Tryggve/automatic_query_engine_container_test_v1:/INPUT azab/rmd-tidyverse:test 

## 4. run within the docker
cd INPUT  

4.1) check if local input files are there
ls tryggve.query1.v1.Rmd && ls fakedata

4.2) knit Rmarkdown file 
Rscript -e "rmarkdown::render('tryggve.query1.v1.Rmd',params=list(arg1='/INPUT',arg2='NOR'))"

#Successful execution will generate tryggve.query1.v1.html file and a few .csv 



# =================================
# TESTING v2 
2020.05.06

## 3. execute the docker
docker run -it -v /Users/luyi/CloudStation/WORK_2020/Tryggve/automatic_query_engine_container_test_v1:/INPUT azab/rmd-tidyverse:test

## 4. run within container
cd INPUT
ls tryggve.query1.v2.Rmd && ls fakedata

Rscript -e "rmarkdown::render('tryggve.query1.v2.Rmd',params=list(arg1='/INPUT',arg2='NOR'))"

#Mostly fine. only summarytool::dfSummary() didn't work well.










