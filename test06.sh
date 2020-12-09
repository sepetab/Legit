#!/bin/dash

echo "The 6th and 7th tests test various aspects of legit rm"
PATH=$PATH:.

echo ----------------------------------------
echo "removing without a legit directory"
rm -rf .legit
sh legit-rm
sh legit-init

echo ----------------------------------------
echo "When there are no commits in repository"
sh legit-rm

echo ----------------------------------------
echo "When given no args to legit-rm"
touch tmp
sh legit-add tmp
sh legit-commit -m "commited"
sh legit-rm 
sh legit-rm tmp

echo ----------------------------------------
echo "When adding multiple files in legit-rm"
touch "a spaced file" b c d e f
#should break below
sh legit-add "a spaced file" b c d e f
sh legit-add b c d e f
sh legit-commit -m "Hello world"
sh legit-rm non_existant b
sh legit-rm  "a spaced file" b c d e f
echo "ls before removing"
ls
sh legit-rm b c d e f
rm "a spaced file"
echo "ls in dir and index respectively done below, shouldnt print any filename other than existing files"
ls
cd .legit/index
ls
cd ../..

echo ----------------------------------------
echo "testing the error outputs of different file scenarios without cache and force options"
rm -rf .legit
sh legit-init
touch tmp
sh legit-add tmp
sh legit-commit -m "commit 0"
echo "edit in index" > tmp
sh legit-add tmp
echo "edit in dir" > tmp
echo "below is when commits,index and dir all have different instances of the file"
sh legit-rm tmp
echo "below is when index and dir have different instances of the file"
sh legit-commit -m "commit -1"
sh legit-rm tmp
echo "below is when commits and index have different instances of the file"
sh legit-add tmp
sh legit-rm tmp
echo "Should remove if same file in all three directories"
sh legit-commit -m "commit -2"
sh legit-rm tmp
echo "tmp shouldnt be here in below ls"
ls
rm -rf .legit
echo "##Test passed##"

