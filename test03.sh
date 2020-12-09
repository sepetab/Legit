#!/bin/dash

echo "Mainly testing the basic syntax of legit-show"

PATH=$PATH:.
rm -rf .legit

echo ----------------------------------------
echo "Testing with no directory"
sh legit-show 

echo ----------------------------------------
echo "Testing with no commits"
sh legit-init
sh legit-show

echo ----------------------------------------
echo "Testing with various different first argument and testing with multiple arguments"  
touch tmp1 tmp2 tmp3
sh legit-add tmp*
sh legit-commit -m "commited all"
sh legit-show 0tmp1
sh legit-show 0:mufasa
sh legit-show :djhfjshd
sh legit-show 0:tmp1 haha 

echo ----------------------------------------
echo "Given invalid commit but a valid file"
sh legit-show 12:tmp1

echo ----------------------------------------
echo "Given valid commit but an invalid filename"
sh legit-show 0:{brroklyn}
sh legit-show :{hi}

echo ----------------------------------------
echo "Given file dosent exist but commit exists, also demonstrated with index" 
sh legit-show 0:lol 
sh legit-show :lol
rm tmp*
rm -rf .legit

echo "##Test passed##"
