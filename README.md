<!-- markdownlint-disable -->
<p align="center">
    <a href="https://github.com/DevelopersToolbox/">
        <img src="https://cdn.wolfsoftware.com/assets/images/github/organisations/developerstoolbox/black-and-white-circle-256.png" alt="DevelopersToolbox logo" />
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/actions/workflows/cicd.yml">
        <img src="https://img.shields.io/github/actions/workflow/status/DevelopersToolbox/bash-flock-wrapper/cicd.yml?branch=master&label=build%20status&style=for-the-badge" alt="Github Build Status" />
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/blob/master/LICENSE.md">
        <img src="https://img.shields.io/github/license/DevelopersToolbox/bash-flock-wrapper?color=blue&label=License&style=for-the-badge" alt="License">
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper">
        <img src="https://img.shields.io/github/created-at/DevelopersToolbox/bash-flock-wrapper?color=blue&label=Created&style=for-the-badge" alt="Created">
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/releases/latest">
        <img src="https://img.shields.io/github/v/release/DevelopersToolbox/bash-flock-wrapper?color=blue&label=Latest%20Release&style=for-the-badge" alt="Release">
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/releases/latest">
        <img src="https://img.shields.io/github/release-date/DevelopersToolbox/bash-flock-wrapper?color=blue&label=Released&style=for-the-badge" alt="Released">
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/releases/latest">
        <img src="https://img.shields.io/github/commits-since/DevelopersToolbox/bash-flock-wrapper/latest.svg?color=blue&style=for-the-badge" alt="Commits since release">
    </a>
    <br />
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/blob/master/.github/CODE_OF_CONDUCT.md">
        <img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/blob/master/.github/CONTRIBUTING.md">
        <img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/blob/master/.github/SECURITY.md">
        <img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/issues">
        <img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge" />
    </a>
</p>

## Overview

## Overview

A bash script skeleton for creating scripts that can only run one instance of itself at any given time by using flock (if installed or a work around if not).

## Usage

Take a copy of the [script](src/bash-flock-wrapper.sh), and rename as required, and use this as the basis for any script that requires to be run exclusively.

It is ideal for jobs in cron for example that run regularly but cannot overlap.

```shell
function actual_script()
{
    echo "I am Locked - Sleep time"
    sleep 3
    echo "Now I Unlock"
}
```

Simply replace the contents of 'actual_script' with the script that you want to be protected by flock. You can treat this function as you would any other function, set variables, call other functions etc etc etc.

## How it works

When the script starts it looks for the existence of a lock file, if it exists it will display an error and exit. If it does not exist it will create it and then continue on with the rest of the script.

<br />
<p align="right"><a href="https://wolfsoftware.com/"><img src="https://img.shields.io/badge/Created%20by%20Wolf%20on%20behalf%20of%20Wolf%20Software-blue?style=for-the-badge" /></a></p>
