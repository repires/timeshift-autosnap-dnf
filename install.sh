#!/bin/bash

# Find dnf plugin directory
plugin_dir=$(dnf config-manager --dump | grep pluginpath | awk -F'=' '{print $2}' | tr -d ' ')

if [ -z "$plugin_dir" ]; then
    echo "Error: Unable to find dnf plugin directory."
    exit 1
fi

echo "DNF plugin directory found at: $plugin_dir"

# Download and copy timeshift.py to the plugin directory
wget -O timeshift.py https://raw.githubusercontent.com/pwernicki/timeshift-autosnap-dnf/master/timeshift.py
if [ $? -ne 0 ]; then
    echo "Error: Failed to download timeshift.py."
    exit 1
fi

cp timeshift.py "$plugin_dir/"
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy timeshift.py to $plugin_dir."
    exit 1
fi

echo "timeshift.py copied to $plugin_dir"

# Download and copy timeshift.conf to /etc/dnf/plugins/ directory
wget -O timeshift.conf https://raw.githubusercontent.com/pwernicki/timeshift-autosnap-dnf/master/timeshift.conf
if [ $? -ne 0 ]; then
    echo "Error: Failed to download timeshift.conf."
    exit 1
fi

mkdir -p /etc/dnf/plugins/
cp timeshift.conf /etc/dnf/plugins/
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy timeshift.conf to /etc/dnf/plugins/."
    exit 1
fi

echo "timeshift.conf copied to /etc/dnf/plugins/"

echo "Task completed successfully."
