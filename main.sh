#!/bin/bash
set -e

features=$(find features -maxdepth 1 -type f | sort)

for feature in $features
do
    if [ ! $(stat -c %A $feature | cut -c4) = "x" ]; then
       echo "$feature is not executable. Aborting."
       exit 1
    fi
done

dialogOptions=$(for x in $features; do
		    status="on"
		    installed="X"
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

# Switch to zsh
exec zsh -l
