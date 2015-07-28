# ------------------------------------------------------------------------------
# Description
# -----------
#
# which will be inserted before the command
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
# * John Reese <john@noswap.com>
#
# ------------------------------------------------------------------------------

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
