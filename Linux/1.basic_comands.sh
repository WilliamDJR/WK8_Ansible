#!/usr/bin/env bash

echo "#1. print working directory"
pwd

echo "#2. This is ls"
ls

echo "#3. This is ls -l"
ls -l

echo "#4. This is ls -altr"
ls -altr

echo "#5. go to the current folder"
cd .
pwd

echo "#6. go to the parent folder"
cd ../
pwd

echo "#7. go back to the previous folder"
cd -
pwd

echo "#8. create path to a folder"
mkdir -p ../hello/world/java/
ls -altr ../

echo "#9. rm folders"
rm -r ../hello/world/java/

rm -r ../hello/world/

rm -r ../hello/

echo "#10. Cat a file"
cat report.txt

echo "#11. To view contents of a file preceding with line numbers"
cat -n report.txt

echo "#12. Less: load a file part by part/load file faster"
less report.txt

echo "#13. chmod 600 report.txt"
chmod 600 report.txt

echo "#14. chmod g+r report.txt"
chmod g+r report.txt

echo "#15. rename report.txt to report1.txt - mv report.txt report1.txt"
mv report.txt report1.txt

echo "#16. cp report1.txt report2.txt"
cp report1.txt report2.txt

echo "#17. less start at first occurrence of pattern “failure” in the file"
dmesg | less -p "hv_pci"

echo "#18. ssh to remote server: ssh -i ~/.ssh/key_filename ubuntu@<server.ip>"
