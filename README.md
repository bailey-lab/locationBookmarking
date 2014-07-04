locationBookmarking
===================

Some convenience bash scripts to bookmark locations 


Define LOCBOOKMHOME and add to path
export LOCBOOKHOME=/pathPrefixToLocationBookmrking/locationBookmarking
export PATH="$PATH:$LOCBOOKHOME"

And add this alias to your $HOME/.bash_aliases file or wherever you keep your aliases 

alias goToLoc='source $LOCBOOKHOME/getLocation.sh'

And add this bash completion to your $HOME/.bash_completion to add auto completion for bookmark names

_goToLoc()
{
    local opts cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(cat $LOCBOOKHOME/.ohThePlacesIveBeen.txt | cut -d$'\t' -f1 | tail -n +2 )
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
}

complete -F _goToLoc goToLoc
