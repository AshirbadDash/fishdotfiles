function ccopy

    command cat > /tmp/ccopy.txt

    set -l data (command base64 -w 0 /tmp/ccopy.txt)

    printf '\e]52;c;%s\a' "$data"

    command rm -f /tmp/ccopy.txt

end
