#!/bin/dash

echo "This tests the -a command of commit"
PATH=$PATH:.
rm -rf .legit
echo ----------------------------------------
echo "testing -a command in commit when index is empty but a commit had 
already been done and the commited file is changed in the directory"
sh legit-init
touch tmp1
sh legit-add tmp1
sh legit-commit -m "commited a file"
sh legit-rm --cached tmp1
echo 1 >> tmp1
sh legit-commit -a -m "Must be empty"
echo "##error should be printed as the commit should be empty"
sh legit-show 1:tmp1

echo ----------------------------------------
echo "testing -a command in commit when index is with a file and is updated in 
dir. It should print out the lastest line when commited"
sh legit-add tmp1
echo "latest_line" > tmp1
sh legit-commit -a -m "should work"
sh legit-show 2:tmp1

echo ----------------------------------------
echo "adding multiple files now to solidate test"
touch tmp2 tmp3 tmp4
sh legit-add tmp2 tmp3
sh legit-commit -m "commit-3"
echo lineinafile > tmp2
sh legit-add tmp4
sh legit-commit -a -m "commit-4"
sh legit-show 4:tmp2

echo ----------------------------------------
echo "checking syntax"
echo a >> tmp2
sh legit-add tmp2
sh legit-commit -m -a "lol"
sh legit-commit -k -m "lol"
rm -rf .legit
rm tmp*


