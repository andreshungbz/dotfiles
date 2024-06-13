# function to recursively add owner execute permission
exec_to_owner() {
    local dir="$1"

    # change to the directory
    cd "$dir" || exit

    # loop through all files and directories
    for item in *
    do
        # check if the item is a regular file
        if [ -f "$item" ]
        then
            # check if the file doesn't have owner execute permission
            if [ ! -x "$item" ]
            then
                # add owner execute permission
                chmod u+x "$item"
                echo "Added owner execute permission to $item"
            fi
        # check if the item is a directory
        elif [ -d "$item" ]
        then
            # recursively call the function for the subdirectory
            exec_to_owner "$dir/$item"
        fi
    done
}