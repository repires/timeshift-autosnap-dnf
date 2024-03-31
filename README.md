# timeshift-autosnap-dnf

## Installation

Find dnf plugin  directory
```
dnf config-manager --dump | grep pluginpath
```
Copy timeshift.py to this directory.  
Copy timeshift.conf to /etc/dnf/plugins/ directory.

We can change plugin behavior by modifying timeshift.conf.

Alternatively you can install using the install.sh script:
Download the install.sh
Run the command:
```
sudo bash install.sh
```
Or simply run the following on the terminal:
```
curl -sSL https://raw.githubusercontent.com/repires/timeshift-autosnap-dnf/master/install.sh | sudo bash
```
