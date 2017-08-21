#!/bin/bash

echo Hello Matt ":)" !


#==============================================check the email format

bad_email=true
echo plese enter your email address :
	read email

while $bad_email
do


if echo "${email}" | grep '^[a-zA-Z0-9]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$' >/dev/null; then
    echo -e "\n =========================  email is valid. ============================ \n"
    echo -e  "Thnak you"
     bad_email=false
else 
    echo -e "\n =========================  email is invalid. ========================== \n"
    echo -e  "plesae try again......"
    read email
fi

done



#=================================================== while loop till enter the password correctly

FILE="/tmp/log"
MD5_HASH=$(cat /tmp/log)
Incorrect_passwd=1

while [ $Incorrect_passwd -eq 1 ]
do
    echo "Enter the password:"
    read -s PASSWD
    if [ "$MD5_HASH" != "$(echo $PASSWD | md5sum | cut -d '-' -f 1)" ]; then
        echo "WRONG password!. Try again"
    else
        echo "Done!"
        Incorrect_passwd=0
    fi
done



#=================================check the validity of IP address 


echo Please enter the IP Address: 

read ip_address
incorrect=true
while $incorrect;
do

if [[ $ip_address =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
 echo -e "\n the IP Address $ip_address Correct\n\n"
 echo -e "==========================================\n"
 incorrect=false
else
 echo -e "the IP Address $ip_address is incorrect\n"
 echo -e "try again........"
 read ip_address

fi
done

#========================================check process "not root"

function process_check() {
ps -Af | grep -v root
}
process_check



