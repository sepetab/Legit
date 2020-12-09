#!/bin/dash

echo "Tests differemnt aspects of legit-add, commit, init and log"
PATH=$PATH:.

rm -rf .legit


echo ----------------------------------------
echo "legit-adding with multiple files"
sh legit-init
touch tmp1 tmp2 tmp3 tmp4 tmp5 rokuja mango
echo tmp1 >> tmp1
echo tmp2 >> tmp2
echo rokuja >> rokuja
echo mango >> mango
sh legit-add tmp* rokuja mango
sh legit-commit -m "commitno<- files added and now gonna show"
sh legit-log
sh legit-show 0:tmp1
sh legit-show 0:tmp2
sh legit-show 0:rokuja
sh legit-show 0:mango

echo ----------------------------------------
echo "multiple files added but one dosent exist. Shouldnt add anything"
#to make sure the commit is valid and index would be different
echo 122 >> tmp1 
sh legit-add tmp* rokuja mango dosent_exist.html
sh legit-commit -m "files shouldnt be addded and should print nothing"
rm tmp* rokuja mango

#THE ORDER OF THE BELOW ERROR MESSSAGES ARE TESTED BY ME FOR DIFFERENT LEGIT COMMANDS 


echo ----------------------------------------
echo "legit log behaviour when a .legit directory isnt there"
rm -rf .legit
sh legit-log
sh legit-init

echo ----------------------------------------
echo "legit log behavior when there are no commits"
sh legit-log

echo ----------------------------------------
echo "legit log given invalid arguments"
touch tmp1 tmp2 tmp3
sh legit-add tmp1
sh legit-commit -m "tmp1"
sh legit-log invalid arguments 
sh legit-add tmp2
sh legit-commit -m "tmp2"
sh legit-add tmp3
sh legit-commit -m "tmp3"

echo ----------------------------------------
echo "Normally functioning log"
sh legit-log
rm tmp*
rm -rf .legit
echo "##Test passed##"
