# Custom load for direnv
# See https://direnv.net/

if [ -n "$(which direnv 2>/dev/null)" ]; then
    current_shell=$(ps -p $$ | awk '$1 != "PID" {print $(NF)}')
    eval "$(direnv hook $current_shell)" || true

    # See https://github.com/direnv/direnv/wiki/Python#restoring-the-ps
    show_virtual_env() {
        if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
            echo "($(basename $VIRTUAL_ENV)) "
        fi
    }
    if [[ -n ${ZSH_VERSION-} ]]; then
        setopt PROMPT_SUBST
    else
        export -f show_virtual_env
    fi

    PS1='$(show_virtual_env)'$PS1
fi
