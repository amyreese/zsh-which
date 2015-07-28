# Copyright 2015 John Reese
# Licensed under the MIT license
#
# Binds [esc] w to run `which` on the command currently in the buffer,
# similar to the default [esc] h for run-help.

which-command-line() {
    PUSHLINE="yes"
    if [[ -z $BUFFER ]]; then
        PUSHLINE="no"
        zle up-history
    fi

    COMMAND=$(echo $BUFFER | cut -d' ' -f1)
    NEWBUFFER="which $COMMAND"

    [[ "$PUSHLINE" = "yes" ]] && zle push-line

    BUFFER="$NEWBUFFER"
    zle end-of-line
}

zle -N which-command-line

# Defined shortcut keys: [Esc] w
bindkey "w" which-command-line
