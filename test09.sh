#!/bin/dash

echo "Tests status messages of legit-status"
PATH=$PATH:.
rm -rf .legit

echo ----------------------------------------
echo "Testing legit status with a file called tmp1 to test all error messages"
sh legit-init
touch tmp1 tmp0
sh legit-add tmp0
sh legit-commit -m "tmp0"
echo "---------tmp1 should be untracked-----------"
sh legit-status
sh legit-add tmp1
echo "---------tmp 1 should be added to index------------"
sh legit-status
sh legit-commit -m "tmp1 commited"
echo "-------tmp1 should print same as repo---------"
sh legit-status
echo a >> tmp1
echo "---------tmp1 should be file changed, changes not staged for commit-------"
sh legit-status
sh legit-add tmp1
echo "-----------tmp1 should be file changed, changes staged for commit--------------"
sh legit-status
echo 123 >> tmp1
echo "-------tmp1 should be file changed, different changes staged for commit---------"
sh legit-status

echo ----------------------------------------
echo "Testing an edge case where it is deleted from the index"
sh legit-rm --cached --force tmp1
echo "---------tmp1 should be untracked-----------" 
sh legit-status
rm tmp*
rm -rf .legit

echo "##Test passed##"

