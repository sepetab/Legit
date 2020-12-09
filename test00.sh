#!/bin/dash

#BASIC TESTS LIKE THESE DONT COVER EDGE CASES. WILL BE EXTENSIVELY TESTED
#IN THE NEXT TESTS

echo "Test00 basic tests on init and add"

PATH=$PATH:.
rm -rf .legit

echo ----------------------------------------
echo "Testing invalid arguments"
sh legit-init invalid args

echo ----------------------------------------
echo "initializing properly"
sh legit-init

echo ----------------------------------------
echo "initializing when .legit exists"  
sh legit-init 

echo ----------------------------------------
echo "adding without giving a filename"
sh legit-add

echo ----------------------------------------
echo "adding a file that dosent exist"
sh legit-add lokiko

echo ----------------------------------------
echo "adding a file properly: shouldnt print any error"
touch tmp_file
sh legit-add tmp_file
rm tmp_file

echo ----------------------------------------
echo "adding without a .legit directory"
rm -rf .legit
sh legit-add
sh legit-init

echo ----------------------------------------
echo "adding with an invalid filename"
touch in^alid{filen}ame.txt
sh legit-add in^alid{filen}ame.txt
rm in^alid{filen}ame.txt

echo ----------------------------------------
echo "adding the same file again and again. commited and shown"
touch tmp_file
echo  "line in the file printed using legit-show" > tmp_file
sh legit-add tmp_file 
sh legit-add tmp_file
sh legit-add tmp_file
sh legit-commit -m "commiting it"
sh legit-show 0:tmp_file
rm tmp_file

echo "##Test passed##"


