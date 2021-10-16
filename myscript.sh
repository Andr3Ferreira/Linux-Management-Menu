#!bin/bash
#Assingment number: Lab 8
#Student Name: Andre dos Santos Ferreira
#Student number: 040992546
#Course: CST8201 312
#Script file name: myscript
#Submission date: Jul 29, 2021
#Description: The following script prints a menu for Linux User Management 

#Prints the menu while looping and prompts the user
while [[ "$option" != "q" ]] && [[ "$option" != "Q" ]]
do
    clear
    echo "A Create a user account"
    echo "B Delete a user account"
    echo "C Change supplementary group for a user account"
    echo "D Change initial group for a user account"
    echo "E Change default login shell for a user account"
    echo "F change account expiration date for a user account"
    echo "Q Quit"
    echo "What would you like to do?: "
    read option

#Decoding the menu choice using if-elif-else structure.
if [[ "$option" == "a" ]] || [[ "$option" == "A" ]]
then
     
    read -p "Username: " usernameA
    read -p "User's home directory (using absolute path): " homedir
    read -p "Default login shell (using absolute path):  " defaultshell
clear
    sleep 3

    # Creates a new user using the info gathered
        sudo useradd -d $homedir -m -s $defaultshell $usernameA

elif [[ "$option" == "b" ]] || [[ "$option" == "B" ]]
then 
    read -p "Inform the username of the account to be deleted: " usernameB
clear
    sleep 3

    # Deletes the user and the home directory selected by the user using the username provided
	sudo userdel -r $usernameB

elif [[ "$option" == "c" ]] || [[ "$option" == "C" ]]
then 
    read -p "Username: " usernameC
    read -p "Group name: " supgroupname
clear  
    sleep 3

    # Adds a supplementary username and group for the user
    sudo groupadd $supgroupname
    sudo usermod -G $supgroupname $usernameC

elif [[ "$option" == "d" ]] || [[ "$option" == "D" ]]
then 
    echo "Username: "
    read usernameD
    echo "Group name: "
    read inigroupname
clear
    sleep 3

    # Changes the initial group for the users account by its username
    sudo groupadd $inigroupname
    sudo usermod -g $inigroupname $usernameD 

elif [[ "$option" == "e" ]] || [[ "$option" == "E" ]]
then 
    echo "Username: "
    read usernameE
    echo 
    read -p "Shell name: " shell
clear
    sleep 3

    # Changes the login shell for the user
	sudo chsh -s $shell $usernameE

elif [[ "$option" == "f" ]] || [[ "$option" == "F" ]]
then 
    read -p "Username: " usernameF
    read -p "Expiration Date (format YYYY-MM-DD): " expdate
clear

    #Changes the expiration date for the user account
	sudo usermod -e $expdate $usernameF

elif [[ "$option" == "q" ]] || [[ "$option" == "Q" ]]
then 
    clear
    sleep 3
else
    echo "Invalid option!"
    sleep 3
fi

done
