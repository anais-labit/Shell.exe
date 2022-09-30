#!/bin/bash

#déclarer ses variables 
add=$(($1 + $3))
sub=$(($1 - $3))
div=$(($1 / $3))
mul=$(($1 * $3))

#calculs 
if [ "$2" == "+" ];then
    echo $add 

elif [ "$2" == "-" ];then
    echo $sub

elif [ "$2" == "/" ];then
    echo $div

elif [ "$2" == "*" ];then
    echo $mul

fi

