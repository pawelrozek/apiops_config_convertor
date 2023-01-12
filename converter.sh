#!/usr/bin/env bash

file=$1

if [ -z "$file" ] ; then
  read -p "Enter the file name in directory to convert: " file
fi

newfile="new_$file"
weAreIn=""
echo "Starting..."
echo " " >> $file
while IFS= read -r line; do
    # echo -e "$line\n"
    if [[ $line == apimServiceName* ]] || [[ $line == "namedValues:" ]] || [[ $line == "loggers:" ]] || [[ $line == "diagnostics:" ]] || [[ $line == "apis:" ]] || [[ $line == "backends:" ]] ; then
      # main titles
      echo -e "$line" >> $newfile
      weAreIn="$line"
    elif [[ $line == "  - name:"* ]]; then
      # its a name property in apis
      if [[ $weAreIn == "apis:" ]]; then
        echo -e "$line" >> $newfile
      else
        # everything else gets properties instead of diagnostics
        echo -e "$line" >> $newfile
        echo -e "    properties:" >> $newfile
      fi
    elif [[ $weAreIn == "apis:" ]]; then
      # We are inside APIs and everything goes in as it was
      echo -e "$line" >> $newfile
    else
      echo -e "  $line" >> $newfile
    fi
done < $file
echo "Completed convertion of '$file'."
echo "Created a new file called '$newfile'."