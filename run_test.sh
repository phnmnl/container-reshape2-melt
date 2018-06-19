#!/bin/bash

apk -U add wget ca-certificates
mkdir /tmp/melt-out/
cd /tmp/melt-out/
wget https://raw.githubusercontent.com/galaxyproject/tools-iuc/master/tools/reshape2/test-data/mtcars.txt

melt.R -i mtcars.txt

# check that files were created
if ! [ -e "/tmp/melt-out/output.tabular" ]; then
	echo "Output tabular file doesn't exist"
	exit 1
fi

echo "All files created successfully"