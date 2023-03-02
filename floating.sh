#!/bin/bash


#perform floating point op in bash
#EXIT CODE:
#       1 ---> Insufficient  number of parameters
#       2 ---> Division By Zero
#       3 ---> Invalid Operator "+,-,*,/"
#       4 ---> Wrong Entry "Not Numbers"


VAL1=${1}
VAL2=${3}
OPERATOR=${2}

#check no. of parameters
[ ${#} -ne 3 ] && echo "Insufficient  number of parameters" && exit 1

#check values are integers
NL1=$(echo ${VAL1} | grep "^\-\{0,1\}[0-9]\.\{0,1\}[0-9]*$" | wc -l)
NL2=$(echo ${VAL2} | grep "^\-\{0,1\}[0-9]\.\{0,1\}[0-9]*$" | wc -l)
[ ${NL1} -eq 0 ] && echo "Wrong Entry" && exit 4
[ ${NL2} -eq 0 ] && echo "Wrong Entry" && exit 4


case "${OPERATOR}" in
        "+")
                echo "scale = 5; $VAL1 + $VAL2" | bc
                ;;
        "-")
                echo "scale = 5; $VAL1 - $VAL2" | bc
                ;;
        "\*")
                echo "scale = 5; $VAL1 * $VAL2" | bc
                ;;
        "/")
                if [ ${VAL2} -eq 0 ]
		then
                        echo "Division By Zero" && exit 2
                else
                        echo "scale = 5; $VAL1 / $VAL2" | bc
                fi
                ;;
        "0")
                echo "Invalid Operator" && exit 3
                ;;
esac
