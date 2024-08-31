#!/bin/bash

FOLDER_COLLECTION=() 
# echo "Hello World  🙏"

# create dir
mkdir -p ClickNext-Lab/{A/{H,I,J,K},B,C,D,E,F,G}


FOLDER_COLLECTION=($(ls ./ClickNext-Lab))

# 
for index in "${!FOLDER_COLLECTION[@]}"; do
    folder=${FOLDER_COLLECTION[$index]}
    # echo "Folder [$index]: $folder"
    
    if [ "$folder" == "A" ]; then
        touch ClickNext-Lab/A/H/test8.txt
        touch ClickNext-Lab/A/I/test9.txt
        touch ClickNext-Lab/A/J/test10.txt
        touch ClickNext-Lab/A/K/test11.txt
        touch ClickNext-Lab/A/test1.txt
    else
        touch ClickNext-Lab/$folder/test$((index + 1)).txt
       
    fi
done
# write data
for file in ClickNext-Lab/*/*/test*.txt; do
  echo "Sekkarin" > "$file"  
  echo "Singhayoo" >> "$file"      
  echo "เคน" >> "$file"          
done
# write data
for file in ClickNext-Lab/*/test*.txt; do
  echo "Sekkarin" > "$file"   
  echo "Singhayoo" >> "$file"      
  echo "เคน" >> "$file"          
done

chmod 644 ClickNext-Lab/A/test1.txt
chmod 440 ClickNext-Lab/B/test2.txt
chmod 751 ClickNext-Lab/C/test3.txt
# windown = -rw-r--r-- 1, on linux = -rw------- 
chmod 600 ClickNext-Lab/A/K/test11.txt

find . -print | sed -e 's;/*/;|;g;s;|; |;g'
cat ClickNext-Lab/A/test1.txt

ls -l ClickNext-Lab/*/*/*.txt
ls -l ClickNext-Lab/*/*.txt

date '+%Y-%b-%d'

# Ref https://www.redhat.com/sysadmin/linux-file-permissions-explained
#   r (read): 4
#   w (write): 2
#   x (execute): 1
# ----
#   Owner: rwx = 4+2+1 = 7
#   Group: r-- = 4+0+0 = 4
#   Others: r-- = 4+0+0 = 4

# Bash Beginner https://www.youtube.com/watch?v=tK9Oc6AEnR4