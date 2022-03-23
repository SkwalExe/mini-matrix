#!/bin/bash
# Author : SkwalExe
# Github : https://github.com/SkwalExe

command="matrix" # the command to execute

# settings
loop="true"
speed="0.5" # delay between each lines
n_chars=10 # number of characters in each line
custom_chars="01"


# parse arguments
while [ $# -gt 0 ]; do
    
    case "$1" in
        -h|--help)
            command="help"
            shift
        ;;
        
        -v|--version)
            command="version"
            shift
        ;;
        
        -s|--speed)
            if [ $# -gt 1 ]; then # if one argument is specified after --speed 
                if [ $(echo "$2" | grep -E "^[0-9]+$") ]; then # if the arg is a number
                    speed=$2
                    shift 2
                elif
                [ $(echo "$2" | grep -E "^[0-9]+\.[0-9]+$") ]; # if the arg is a float
                then
                    speed=$2
                    shift 2
                else
                    echo "Error: Invalid speed value"
                    exit 1
                fi
            else
                echo "Error: Missing speed value"
                exit 1
            fi
            
        ;;
        
        -l|--loop)
            
            if [ $# -gt 1 ]; then # if there is one argument after --loop
                if [ $(echo "$2" | grep -E "^(true|false)$") ]; then # if the arg is true or false
                    loop=$2
                    shift 2
                else
                    echo "Error: Invalid loop value, expected true or false"
                    exit 1
                fi
            else
                echo "Error: Expected true or false as argument after -l"
                exit 1
            fi
            
        ;;
        
        -c|--chars)
            
            if [ $# -gt 1 ]; then # if there is one argument after --chars
                if [ $(echo "$2" | grep -E "^[0-9]+$") ]; then # if the arg is a number
                    n_chars=$2
                    shift 2
                else
                    echo "Error: Invalid number after -c"
                    exit 1
                fi
            else
                echo "Error: Missing number number after -c"
                exit 1
            fi
            
            
        ;;
        
        -a|--custom-chars)
            
            if [ $# -gt 1 ]; then # if there is one argument after --custom-chars
                custom_chars=$2
                shift 2
                
            else
                echo "Error: Missing string after -a"
                exit 1
            fi
        ;;
        
        *)
            echo "Unknown argument: $1"
            exit 1
        ;;
        
        
    esac
    
done

function matrix() {
    
    line=""
    
    for ((i=0; i<=n_chars; i++)); do
        # get random char out of custom chars
        char=$(echo "$custom_chars" | fold -w1 | shuf | head -n1)
        line="$line$char"
    done
    
    printf "%s" "$line"
    
}

case $command in
    
    matrix)
        if [ $loop = "true" ]; then
            while true; do
                matrix
                sleep $speed
                echo ""
            done
        else
            matrix
        fi
    ;;
    help)
        echo "Usage: mini-matrix [OPTION]"
        echo ""
        echo "Autor : SkwalExe [Léopold Ibghy Koprivnik]"
        echo "Github : https://github.com/SkwalExe"
        echo ""
        echo "Displays a matrix of random characters"
        echo ""
        echo "Options:"
        echo "  -h, --help    Show this help message and exit"
        echo "  -v, --version Show version and exit"
        echo "  -s, --speed   Set the delay between each line [default: 0.5]"
        echo "  -l, --loop    Loop the output [default: false]"
        echo "  -c, --chars   Set the number of characters to output [default: 10]"
        echo "  -a, --custom-chars   Set the custom characters to use [default: \"01\"]"
    ;;
    
    version)
        echo "mini-matrix 0.2.0"
    ;;
    
esac


