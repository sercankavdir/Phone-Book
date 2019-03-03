#!/bin/bash

dialog --title "SEARCH" --menu "Choose one:" 10 50 3 1 "Search by name" 2 "Search by phone" 3 "RETURN TO THE MENU" 2> .answer
answer="$(cat .answer)"

case $answer in
	1)dialog --inputbox "Enter the name:" 8 40 2>.name
		name="$(cat .name)"
		grep $name address-book.txt>foundName.txt
		dialog --textbox foundName.txt 20 70
		;;
	2)dialog --inputbox "Enter the phone:" 8 40 2>.phone
		phone="$(cat .phone)"
		grep $phone address-book.txt>foundPhone.txt
		dialog --textbox foundPhone.txt 20 70
		;;
	3)./menu.sh;;

esac
