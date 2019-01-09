#!/bin/bash

CONFIG_PATH=${CONFIG_PATH:-"ITK_SMS_PDS/tkw.properties"}
USERNAME=${TKW_USERNAME:-"Docker-TKW"}

# Fix config files
config_paths=("/opt/TKW/config" "/opt/TKW/contrib")
file_patterns_to_fix=("*.properties" "*.txt" "*.conf")
rootpath="\/opt\/TKW"

for path in "${config_paths[@]}"
do
  for pattern in "${file_patterns_to_fix[@]}"
  do
    filelist=$(find $path -name "$pattern")
    for file in $filelist
    do
      echo "Fixing file: $file"
      sed -i -e "s/__USER_NAME_AND_ORGANISATION_NOT_SET__/$USERNAME/g" $file
      sed -i -e "s/TKW_ROOT/$rootpath/g" $file
    done
  done
done

# Now start the simulator
cd /opt/TKW
java -jar TKW.jar -simulator /opt/TKW/config/${CONFIG_PATH}

