#!/bin/bash

MYPAGE=mypage
ID=kottn

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public
hugo
git add .

# Commit changes. for "${MYPAGE}"
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"
git push origin master

# Commit changes. for "${ID}.github.io"
cd ..
git clone https://github.com/${ID}/${ID}.github.io
cd ${ID}.github.io && rm -rf * && cp -r ../${MYPAGE}/public/* .
git add .
git commit -m "$msg"
git push origin master

cd ..
rm -rf ${ID}.github.io
cd ${MYPAGE}
