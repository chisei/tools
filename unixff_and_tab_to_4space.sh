#!/bin/bash
# dos to unix.
# and tab to 4space.

# validation
if [ $# = 0 ]; then
    echo "Argument is required."
    exit 1
fi

file_name=$1

# file exists
if [ ! \( -e $file_name \) ]; then
    echo "'$file_name' is not found."
    exit 1
fi

# override
tmp_file_name=$$
sed -e "s/\t/    /g" $file_name | tr -d "\r" > $tmp_file_name
mv $tmp_file_name $file_name
