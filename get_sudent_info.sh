#!/bin/bash
input="students.csv"

echo "STUDENTS:"
while IFS= read -r line
do
  echo "-- User:   $line"| tr "a-z" "A-Z"
  USER_INFO=$(curl -s "https://api.github.com/users/${line}")
  USER_INFO_FILE=$(cat info/${line}.txt)
  # echo "  | User: $line"
  echo "$USER_INFO" | grep API
  echo "$USER_INFO" | grep \"name\" |awk -F '"' '{print " | Name:    " $4}'
  echo "$USER_INFO" | grep \"url\" |awk -F '"' '{print " | GitHub:  " $4}'
  echo "$USER_INFO" | grep \"created_at\" |awk -F '"' '{print " | Created: " $4}'
  #curl -s "https://api.github.com/users/${line}" | grep \"name\" |awk -F '"' '{print " | Name:   " $4}'
  #curl -s "https://api.github.com/users/${line}" | grep \"url\" |awk -F '"' '{print " | GitHub: " $4}'
  echo " | Info:    $USER_INFO_FILE"
done < "$input"
