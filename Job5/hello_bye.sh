#!/bin/bash

#si option Hello
if [ "$1" == "Hello" ];then 
    echo "Bonjour, je suis un script !" 

#sinon option Bye
elif [ "$1" == "Bye" ];then
    echo "Au revoir et bonne journée"

else 
    echo "Choissisez Hello ou Bye"

fi