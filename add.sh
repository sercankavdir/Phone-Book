#!/bin/bash

BOOK="address-book.txt"

dialog --inputbox "Enter your name: " 8 60 2>.name
name="$(cat .name)"
dialog --inputbox "Enter your surname:" 8 60 2>.surname
surname="$(cat .surname)"

FPhoneNumber(){
dialog --inputbox "Enter the phone number: " 8 60 2>.phone
userPhone="$(cat .phone)"

awk '{print $3}' address-book.txt>userPhone.txt
check=$(grep $userPhone userPhone.txt)
	if [ "$userPhone" == "$check" ]
	then 
		dialog --title "ERROR" --msgbox "The same number exist.." 5 75
		dialog --title "ERROR" --yesno "Go Back Menu/Exit.." 5 75
		response2=$?
		case $response2 in 0)
			./menu.sh;;
		1)echo "Bye"; break;;
	esac

	else 
	
	dialog --title "Message" --yesno "Are you sure?" 6 25
	response=$?
	case $response in 0)
	echo $name $surname $userPhone >> address-book.txt
	dialog --title "Message" --msgbox "New person created.." 5 75;;
	1) dialog --title "ERROR" --msgbox "Please try again.." 5 75;;
esac

fi
}
FPhoneNumber
