#!/bin/dash

echo "This test tests on features of commit"

PATH=$PATH:.
rm -rf .legit
sh legit-init
echo ----------------------------------------
echo "Testing invalid arguments"
sh legit-commit -m -a "hello world"
sh legit-commit hello -m "hello world"
sh legit-commit -m "hello world" ujkfdjnhds
sh legit-commit -k "hello world" -a
#valid commit
echo ----------------------------------------
echo "commiting properly"
touch tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
rm tmp.txt

echo ----------------------------------------
echo "commit without a .legit directory"
rm -rf .legit
sh legit-commit
sh legit-init
echo ----------------------------------------
echo "checking commit numbering"
touch tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
echo 1 >> tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
echo 1 >> tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
echo 1 >> tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
echo 1 >> tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
echo i am line 1 > tmp.txt
echo ----------------------------------------
echo "commiting when the file is not changed"
sh legit-commit -m "tmp.txt"
echo ----------------------------------------
echo "commiting when there is nothing in the index and no previous commmits"
rm -rf .legit
sh legit-init
sh legit-commit -m "Nothing there"
rm -rf .legit
rm tmp.txt
echo "##Test passed##"


