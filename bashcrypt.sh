#!/bin/bash
# Author: xfr0g
# Date: 2024
# Description: BASHCRYPT is a Bash script that can encrypt the original file that is provided by the endpoint user.

# Colors
RED='\x1B[31m'
GREEN='\x1B[32m'
YELLOW='\x1B[33m'
BLUE='\x1B[34m'
MAGENTA='\x1B[35m'
CYAN='\x1B[36m'
NC='\033[0m'

# Interface
echo -e "${GREEN}____________________________  ___________________  _________________"
echo -e "${GREEN}___  __ )__    |_  ___/__  / / /_  ____/__  __ \ \/ /__  __ \__  __/"
echo -e "${GREEN}__  __  |_  /| |____ \__  /_/ /_  /    __  /_/ /_  /__  /_/ /_  /"
echo -e "${GREEN}_  /_/ /_  ___ |___/ /_  __  / / /___  _  _, _/_  / _  ____/_  /"
echo -e "${GREEN}/_____/ /_/  |_/____/ /_/ /_/  \____/  /_/ |_| /_/  /_/     /_/"
echo -e "${YELLOW}[ Author: ${RED}xfr0g ${YELLOW}]                                   [ Version: ${RED}1.0 ${YELLOW}]"
echo

# We'll ask the endpoint user for the script that s/he wants to encrypt.
echo -ne "${GREEN}[${YELLOW}*${GREEN}] ${NC}Enter file name: "
read input_file_name

# We'll check if the file exists first before encrypting it using the built-in base64 command.
echo -e "${NC}\nChecking for $input_file_name..."
sleep 3

if [[ ! -f $input_file_name ]]
then
	echo -e "\n${GREEN}[${YELLOW}x${GREEN}] ${NC}$input_file_name ${RED}does not exist."
	echo -e "${GREEN}[${YELLOW}*${GREEN}] ${NC}Quitting now."
	exit 1
else
	echo -e "\n${GREEN}[${YELLOW}+${GREEN}] ${NC}$input_file_name ${RED}exists."
fi

# We'll need to ask the endpoint user for the output file name.
echo -ne "\n${GREEN}[${YELLOW}*${GREEN}] ${NC}Enter output file name: "
read output_file_name

# Read the content of the script from the input file
content=$(<"$input_file_name")

# Encode the script content using base64
encrypted_file=$(echo -n "$content" | base64)

# Write the encoded script to the specified output file
echo "$encrypted_file" | base64 > "$output_file_name"

# Provide information to the user
echo -e "\n${GREEN}[${YELLOW}*${GREEN}] ${NC}Script encoded and saved to $output_file_name"
echo -e "${GREEN}[${YELLOW}*${GREEN}] ${NC}Quitting now."
