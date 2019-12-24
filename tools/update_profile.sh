# add this to your bash shell profile
function git(){
 if [[ $1 == "role" ]]
 then
    read -p "Enter role name: " ROLE_NAME
    export ROLE_NAME
 else
    /usr/bin/git $@
 fi
}

# For zshell on MacOS
git(){
 if [[ $1 == "role" ]]
 then
    vared -p "Enter role name: " ROLE_NAME
    export ROLE_NAME
 else
    /usr/bin/git $@
 fi
}