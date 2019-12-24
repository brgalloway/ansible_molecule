# add this to your shell profile

function git(){
 if [[ $1 == "role" ]]
 then
    read -p "Enter role name: " ROLE_NAME
    export ROLE_NAME
 else
    /usr/bin/git $@
 fi
}