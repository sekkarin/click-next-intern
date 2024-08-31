#!/bin/bash
echo "###########################################"
echo "##    This script generates a pattern    ##"
echo "###########################################"

echo "Enter your Line Number:"
read LINE_NUMBER

if [ -z "$LINE_NUMBER" ]; then
    echo -e "\033[31mERROR:\033[0m \033[33mYou not input number!\033[0m"
    exit 1
fi

if ! [[ "$LINE_NUMBER" =~ ^[1-9]+$ ]]; then
     echo -e "\033[31mERROR:\033[0m \033[33mPlease enter a valid positive integer for the line number.\033[0m"
    exit 1
fi

echo "###########################################"
start=1
increment=3
for (( i=1; i<=LINE_NUMBER; i++ )); do  
    for (( j=1; j<=i; j++ )); do  
        if [ $j -eq 1 ] && [ $i -eq 1 ]; then  
            echo -n "$start "  
        elif [ $j -eq 1 ]; then  
            start=$((start + increment)) 
            echo -n "$start "
        else  
            start=$((start + 2))  
            echo -n "$start "
        fi
    done
    echo  
done
