#!/usr/bin/env bash
# Author : SkwalExe
# Github : https://github.com/SkwalExe

blue='\033[0;96m'
red='\033[0;91m'
green='\033[0;92m'
yellow='\033[0;93m'
purple='\033[0;95m'
white='\033[0;97m'

bg_blue='\033[0;44m'
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_cyan='\033[0;46m'
bg_white='\033[0;47m'
bg_purple='\033[0;45m'

reset='\033[0m'

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
        printf "${bg_blue} Mini-matrix ${reset}\n"
        printf "${blue}━━━━━━━━━━━━━━━━━${reset}\n"
        printf "Author: ${green}@SkwalExe${reset}\n"
        printf "Github: ${green}https://github.com/SkwalExe/daily-todo${reset}\n"
        printf "${blue}━━━━━━━━━━━━━━━━━${reset}\n"
        printf "Output random 0 and 1 or custom characters with a matrix-like effect\n"
        printf "${blue}━━━━━━━━━━━━━━━━━${reset}\n"
        printf "$ mini-matrix [Options]:\n"
        printf "${green}  -h, --help${reset}    Show this help message and exit\n"
        printf "${green}  -v, --version${reset} Show version and exit\n"
        printf "${green}  -s, --speed${reset}   Set the delay between each line ${yellow}[default: 0.5]\n"
        printf "${green}  -l, --loop${reset}    Loop the output ${yellow}[default: false]\n"
        printf "${green}  -c, --chars${reset}   Set the number of characters to output ${yellow}[default: 10]\n"
        printf "${green}  -a, --custom-chars${reset}   Set the custom characters to use ${yellow}[default: \"01\"]\n"
        printf "${blue}━━━━━━━━━━━━━━━━━${reset}\n"
       
        
    ;;
    
    version)
        echo "${purple}mini-matrix 0.2.1${reset}"
    ;;
    
esac


