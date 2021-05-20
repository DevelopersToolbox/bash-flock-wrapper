#!/usr/bin/env bash

# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# A bash script skeleton for creating scripts that can only run one instances at   #
# any given time by using flock. Ideal for cron based tasks that might overlap     #
# due to timing constrants.                                                        #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Actual Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the 'main' function for the actual script that you want to run inside    #
# the lock. This can call other functions, or have arguments passed to it etc.     #
# -------------------------------------------------------------------------------- #

function actual_script()
{
    echo "I am Locked - Sleep time"

    sleep 3

    echo "Now I Unlock"
}

# -------------------------------------------------------------------------------- #
# Core Internals                                                                   #
# -------------------------------------------------------------------------------- #
# All of the code below form the core internals of the flock wrapper. No changes   #
# should need to be made to this code and all changes / additions should be made   #
# to the actual_script function above.                                             #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Global Variables                                                                 #
# -------------------------------------------------------------------------------- #
# The following global variables are used simple to make the header look nice.     #
# -------------------------------------------------------------------------------- #

# shellcheck disable=SC2155
readonly PROGNAME=$(basename "$0")
readonly LOCKFILE_DIR=/tmp
readonly LOCK_FD=200

# -------------------------------------------------------------------------------- #
# Lock                                                                             #
# -------------------------------------------------------------------------------- #
# This function handle the creation and validation of existing lock files.         #
# -------------------------------------------------------------------------------- #

function lock()
{
    local prefix=$1
    local fd=${2:-$LOCK_FD}
    lock_file=$LOCKFILE_DIR/$prefix.lock

    command=$(command -v "flock")
    if [[ -z $command ]]; then                # Flock is not installed - work around

        if ( set -o noclobber; echo "$$" > "${lock_file}") 2> /dev/null;
        then
            # shellcheck disable=SC2064
            trap 'rm -f "${lock_file}"; exit $?' INT TERM EXIT
            return 0
        else
            return 1
        fi
    else
        eval "exec $fd > ${lock_file}"

        flock -n "${fd}" && return 0 || return 1
    fi
}

# -------------------------------------------------------------------------------- #
# eexit                                                                            #
# -------------------------------------------------------------------------------- #
# A simple exit wrapper which will output the given error before exiting.          #
# -------------------------------------------------------------------------------- #

function eexit()
{
    local message="${1:-}"

    if [[ -n "${message}" ]]; then
        echo "${message}"
    fi
    exit 1
}

# -------------------------------------------------------------------------------- #
# Wrapper                                                                          #
# -------------------------------------------------------------------------------- #
# The main wrapper function which handles the locking and calling of main          #
# processing function.                                                             #
# -------------------------------------------------------------------------------- #

function wrapper()
{
    lock "${PROGNAME}" || eexit "Only one instance of ${PROGNAME} can run at one time."

    actual_script
}

# -------------------------------------------------------------------------------- #
# Main()                                                                           #
# -------------------------------------------------------------------------------- #
# This is the actual 'script' and the functions/sub routines are called in order.  #
# -------------------------------------------------------------------------------- #

wrapper

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
