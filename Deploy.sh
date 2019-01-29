#!/bin/bash
MYP_REPO=mypage
ID=kottn
DOM="kottn.me"
msg="rebuilding site `date +%F-%A`"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
rm -rf public
hugo

# Commit changes. for "${ID}.github.io"
cd ..
git clone https://github.com/${ID}/${ID}.github.io
cd ${ID}.github.io && rm -rf * && cp -r ../${MYP_REPO}/public/* .
echo ${DOM} > ./CNAME
git add .
git commit -m "$msg"
git push origin master

cd ..
rm -rf ${ID}.github.io
cd ${MYP_REPO}
rm -rf public
