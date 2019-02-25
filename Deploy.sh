#!/bin/bash
MYP_REPO=mypage
ID=kottn
DOM="kottn.me"
msg="Updated at `date +%F-%A`"

echo ""
echo "Hey! You already done push? Check below."
git status
echo ""

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

source activate mkdocs
mkdocs build

cd ..
git clone https://github.com/${ID}/${ID}.github.io
cd ${ID}.github.io && rm -rf * && cp -r ../${MYP_REPO}/site/* .
echo ${DOM} > ./CNAME
git add .
git commit -m "$msg"
git push origin master

cd ..
rm -rf ${ID}.github.io
cd ${MYP_REPO}

rm -rf site
