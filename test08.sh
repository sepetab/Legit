#!/bin/dash

echo "Tests normal functioning of legit-status"
PATH=$PATH:.
rm -rf .legit

echo ----------------------------------------
echo "Testing with no directory"
sh legit-status

echo ----------------------------------------
echo "Testing with no commits"
sh legit-init
sh legit-status

echo ----------------------------------------
echo "Testing with invalid arguments (should function normally as long as legit-status is mentioned"
touch tmp1
sh legit-add tmp1
sh legit-commit -m "hello world"
sh legit-status my
sh legit-status any number of args

echo ----------------------------------------
echo "Testing if it omits any invalid filenames by creating a file : fi^^nam^"
touch fi^^nam^
sh legit-status
rm fi^^nam^

echo ----------------------------------------
echo "Testing untracked with edgecases such as in commit and directory but not in index"
sh legit-rm --cached tmp1
touch tmp2
#both should be untracked below
sh legit-status 

echo ----------------------------------------
echo "testing 'same as repo' by adding tmp1 again and 'added to index' by adding tmp2"
sh legit-add tmp1
sh legit-add tmp2
sh legit-status
rm tmp*
rm -rf .legit

echo "##Test passed##"

 
