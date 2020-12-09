#!/bin/dash

echo "Testing the cache and force option of legit-rm"
PATH=$PATH:.
rm -rf .legit
sh legit-init

echo ----------------------------------------
echo "testing that force dosent remove any directory files if it dosent exist in the index"
echo "It also commits the file but uses cache option to delete it just from the index"
touch tmp1 tmp2
sh legit-add tmp1
sh legit-commit -m "commited tmp1"
sh legit-rm --cached tmp1
#shouldnt remove below
sh legit-rm --force tmp1
sh legit-add tmp1 tmp2
sh legit-commit -m "commited both"
sh legit-rm tmp*
rm -rf .legit

echo ----------------------------------------
echo "testing that cache does delete the file in the index even if different files exist between index and dir or index and latestcommit."
sh legit-init
touch tmp1 tmp2 
sh legit-add tmp1
sh legit-commit -m "tmp1 commited"
echo 123 >> tmp1
echo "below when directory and index are different, should remove from index: no error"
sh legit-rm --cached tmp1
sh legit-add tmp1
sh legit-commit -m "now all same"
echo a > tmp1
sh legit-add tmp1
echo "below when commits and index are different, should remove from index: no error"
sh legit-rm --cached tmp1
sh legit-add tmp1
echo b > tmp1
echo "below when dir, commits and index are different, should not remove from index, an error should be produced"
sh legit-rm --cached tmp1

echo ----------------------------------------
echo "force method should override the above case"
sh legit-rm --force --cached tmp1
rm tmp*
rm -rf .legit
echo "##Test passed##"
