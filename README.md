<h1 align="center">
	<a href="https://github.com/WolfSoftware">
		<img src="https://raw.githubusercontent.com/WolfSoftware/branding/master/images/general/banners/64/black-and-white.png" alt="Wolf Software Logo" />
	</a>
	<br>
	Bash Flock Wrapper
</h1>

<p align="center">
	<a href="https://travis-ci.com/DevelopersToolbox/bash-flock-wrapper">
		<img src="https://img.shields.io/travis/com/DevelopersToolbox/bash-flock-wrapper/master?style=for-the-badge&logo=travis" alt="Build Status">
	</a>
	<a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/releases/latest">
		<img src="https://img.shields.io/github/v/release/DevelopersToolbox/bash-flock-wrapper?color=blue&style=for-the-badge&logo=github&logoColor=white&label=Latest%20Release" alt="Release">
	</a>
	<a href="https://github.com/DevelopersToolbox/bash-flock-wrapper/releases/latest">
		<img src="https://img.shields.io/github/commits-since/DevelopersToolbox/bash-flock-wrapper/latest.svg?color=blue&style=for-the-badge&logo=github&logoColor=white" alt="Commits since release">
	</a>
	<a href="LICENSE.md">
		<img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" alt="Software License">
	</a>
	<br>
	<a href=".github/CODE_OF_CONDUCT.md">
		<img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
	<a href=".github/CONTRIBUTING.md">
		<img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
	<a href=".github/SECURITY.md">
		<img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
	<a href=".github/SUPPORT.md">
		<img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
</p>

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

Simply replace the contents of 'actual_script' with the script that you want to be protected by flock. You can treat this function as you would any other funtion, set variables, call other functions etc etc etc.

## How it works

When the script starts it looks for the existence of a lock file, if it exists it will display an error and exit. If it does not exist it will create it and then continue on with the rest of the script.

## Contributors

<p>
	<a href="https://github.com/TGWolf">
		<img src="https://img.shields.io/badge/Wolf-black?style=for-the-badge" />
	</a>
</p>

## Show Support

<p>
	<a href="https://ko-fi.com/wolfsoftware">
		<img src="https://img.shields.io/badge/Ko%20Fi-blue?style=for-the-badge&logo=ko-fi&logoColor=white" />
	</a>
</p>
