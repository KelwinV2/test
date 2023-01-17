#!/bin/bash

# Define the list of users
USERS=(
    "ranjit.shah <ranjit.shah@example.com>"
    "Deep.shah <Deep.shah@example.com>"
    "Antariksh.gosain <Antariksh.gosain@example.com>"
    "Banurekha.chalamkuri <Banurekha.chalamkuri@example.com>"
    "Shravan.reddy <Shravan.reddy@example.com>"
)

# Initialize the user index
USER_INDEX=0
NUM_USERS=${#USERS[@]}

# Loop through all files in the current directory
for FILE in *; do
    if [ -f "$FILE" ]; then
        # Set the user name and email globally
        IFS='<' read -r NAME EMAIL <<< "${USERS[$USER_INDEX]}"
        EMAIL=${EMAIL%>} # Remove the trailing '>' from the email

        git config --global user.name "$NAME"
        git config --global user.email "$EMAIL"

        # Add the file and commit it
        git add "$FILE"
        git commit -m "Sprint-1"
        git commit --amend --date="2023-01-17 14:15:34"
        git push origin main

        # Increment the user index and wrap around if necessary
        USER_INDEX=$(( (USER_INDEX + 1) % NUM_USERS ))
    fi
done

# Optionally, you might want to reset the global user configuration to a default user
# Uncomment the following lines and replace with your default user info if needed
# git config --global user.name "Default User"
# git config --global user.email "defaultuser@example.com"