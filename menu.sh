#!/bin/bash
while true
do

dialog --title "MENU" --menu "MAIN-Menu" 15 50 6 1 "ADD" 2 "DELETE" 3 "LIST" 4 "SEARCH" 5 "EXIT" 2> .choice

choice="$(cat .choice)"

case $choice in 
	1) ./add.sh;;
	2)./delete.sh;;
	3)./list.sh;;
	4)./search.sh;;
	5)dialog --title "EXIT" --msgbox "See you.." 5 20; break;;
	esac

done
