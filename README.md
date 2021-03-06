Factotum
========

Factotum is a **BASH** script has been designed to tune up the system after installation and install the essential packages not provided by default from Ubuntu. Just customize the script, download it, and start it from the terminal.
On the site (http://factotum-telnetboy.rhcloud.com) you can customize the script to suit your needs.

## Features

* Set swappiness from sysctl.conf
* Set cache_pressure from sysctl.conf
* Show/hide startup applications
* Install your favourite version of Java ( Oracle / OpenJdk )
* Install the ubuntu/kubuntu/lubuntu/xubuntu-restricted-extras package
* Install libdvdcss2 included with *-restricted-extras
* Install other generic packages that might be useful like "VLC Media Player", "Synaptic", "GKsu"

## Usage

You can customize the script directly from the project site (http://factotum-telnetboy.rhcloud.com) or download the full version that include:

* swappiness = 10
* cache_pressure = 50
* Show startup applications = True
* Java = oracle-java8-installer
* Restricted = ubuntu-restricted-extras
* Packages = "VLC Media Player", "Synaptic", "GKsu"


Simply copy and paste the following code into a terminal, and press enter to download and start the standard full version of the script:

```wget -q -O - https://factotum-telnetboy.rhcloud.com/factotum.sh | bash```


