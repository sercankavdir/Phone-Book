#!/bin/bash
BOOK="address-book.txt"
dialog --textbox address-book.txt 20 70

dialog --inputbox "Enter the full phone that you'd like to delete:" 8 40 2>.deleted
deleted="$(cat .deleted)"
grep -v $deleted address-book.txt
