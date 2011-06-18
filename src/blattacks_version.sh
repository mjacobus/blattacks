#!/bin/bash
#blattacks_version.sh

(cat /opt/blattacks/src/VERSION.txt 2> /dev/null  && exit 0 )|| echo "Unknown version" 


exit 1 
