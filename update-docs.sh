#!/bin/bash



##      Quick and dirty script to update the core documents
##      from the RHEL9-Workshop.
##
##        Step 1  Clean up workshop/content/documentation
##        Step 2  Pull a current archive from github
##        Step 3  Extract the currecnt documents into place
##     
##      Then the repo will be ready for a commit and push
##     



##
##    VARS
##



MY_TMP="/var/tmp"

GIT_REPO="https://github.com/xtophd"
GIT_PROJECT="RHEL9-Workshop"
GIT_BRANCH="summit-2022"

DOC_SRC="${MY_TMP}/documentation/_include"
DOC_DST="./workshop/content/documentation"



##
##    Cleanup pre-existing archive
##

rm -f ${MY_TMP}/${GIT_PRJ}-${GIT_REF}.tar.gz



##
##    Fetch the tar.gz archive from github
##

wget -O ${MY_TMP}/${GIT_PROJECT}-${GIT_BRANCH}.tar.gz ${GIT_REPO}/${GIT_PROJECT}/archive/${GIT_BRANCH}.tar.gz




##
##    Extract the docs into the documentation directory
##

cd ./workshop/content/documentation && tar zxvf ${MY_TMP}/${GIT_PROJECT}-${GIT_BRANCH}.tar.gz --strip-components=3 --overwrite '*documentation/_include/*'

