#!/bin/bash
set -e

features=$(find features -maxdepth 1 -type f)
dialogOptions=$(for x in $features; do
		    status="on"
		    installed="(not_installed)"
		    if $($x installed); then
			status="off"
			installed="(installed)";
		    fi
		    echo -n " $x $installed $status"
		done;)

selectedFeatures=$(dialog \
		       --output-fd 1 \
		       --erase-on-exit \
		       --checklist \
		       'Select features to install:' \
		       0 0 0 \
		       ${dialogOptions[@]})
for feature in $selectedFeatures
do
    echo ""
    echo "==========================="
    echo "Install feature $feature:"
    echo "==========================="
    eval "$feature install"
done
