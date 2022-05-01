#!/bin/bash
# Shell script to get a copy from MySQL

# Paths from which the script can be called from
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# If something goes wrong, exit the script
set -e

# Script directory
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"         # Linux code: $()
readonly SCRIPT_NAME="$(basename "$0")"

# Call the following functions (Note: In bash everything runs asynchronous)
run
make_backup

function assert_is_installed {
	# Get the first parameter
    local readonly name="$1"

    # Validates if the command has an output
	if [[ ! $(command -v ${name})]]; then
        # If the output is empty, calls the log_error frunction and exit the script
		log_error "The binary '$name' is required but it isn't in our system"
		exit 1
    fi
}

function log_error {
	local readonly message "$1"
	log "ERROR" "$message"          # Pass 2 parameters to the log function
}

function  log {
	local readonly type="$1"
	local readonly message="$2"

    # Notes:
        # Redirections (>)
        # Errors (2)
	local readonly timestamp=$(date +"%Y-%m-%d %H:%M:%S") >&2 echo -e "${timestamp} [${type}] [$SCRIPT_NAME] ${message}"
}

function run {
    # check requirements
	assert_is_installed "mysql"
	assert_is_installed "mysqldump"
	assert_is_installed "gzip"
	assert_is_installed "aws"
}

function make_backup {
    # Make a copy of a database

    # Print the home directory
	local BAK="$(echo $HOME/mysql)"

    # Get the path to the following packages
    local MYSQL="$(which mysql)"
	local MYSQLDUMP="$(which mysqldump)"
	local GZIP="$(which gzip)"

    # Get the current time
	local NOW="$(date +"+%d-%m-%Y")"

	# Destiny bucket for the database copy
    local BUCKET="xxxxx"

    # Database credentials
	USER="xxxxxx"
	PASS="xxxxxx"
	HOST="xxxxxx"
	DATABASE="xxxxxx"

    # Create the BAK directory if it does not exists
	[! -d "$BAK" ] && mkdir -p "$BAK"

    # Create the backup file
	FILE=$BAK/$DATABASE.$NOW-$(date +"%T").gz

    # Calculates the seconds it takes to make the backup
    local SECONDS=0

    # Execute mysqldump
	$MYSQLDUMP --single-transaction --set-gtid-purged=OFF -u $USER -p $PASS -h $HOST $DATABASE | $GZIP -9 > $FILE

	duration=$SECONDS
	echo "$($duration / 60) minutes"

    # Push the backup file to the specified bucket
	aws s3 cp $BAK "s3://$BUCKET" --recursive
}