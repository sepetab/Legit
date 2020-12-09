#!/bin/dash

PATH=$PATH:.
echo "Testing various edge cases of subset-0"
rm -rf .legit

echo ----------------------------------------
echo "adding a directory using legit add"
sh legit-init
mkdir a_dir
sh legit-add a_dir
rm -rf a_dir

echo ----------------------------------------
echo "adding a file and removing from directory and adding the same file"
echo "This should remove the file from the index and print out nothing to commit"
rm -rf .legit
sh legit-init
touch tmp_file
sh legit-add tmp_file
rm tmp_file
sh legit-add tmp_file
sh legit-commit -m "hello world"

echo ----------------------------------------
echo "commiting after deleting a file in the index"
echo "I am a line in the file" > tmp.txt
sh legit-add tmp.txt
sh legit-commit -m "tmp.txt"
sh legit-rm --cached tmp.txt
sh legit-commit -m "commited after delete so file shouldnt exist in commit 1"
echo "###lines of a file in commit 0"
sh legit-show 0:tmp.txt
echo "###lines of a file in commit 1-should be an error"
sh legit-show 1:tmp.txt

rm -rf .legit
rm tmp.txt

echo "##Test passed##"


