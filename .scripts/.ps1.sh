export PS1="\n\e[0;34m\e[47m $(date +%k:%M:%S)  ~\$(get_current_directory)  \e[m\e[0;\$(get_arrow_color)\e[47m◀\e[m\e[m\e[0;37m\e[\$(get_font_background) ⎇  \$(git_prompt) \e[m\e[0;\$(get_arrow_color)▶\e[0;34m \n-> "

get_arrow_color() {
    if [[ "$(parse_git_dirty)" == "1" ]]
    then
        echo '31m'
    else
        echo '34m'
    fi
}

get_font_background() {
    if [[ "$(parse_git_dirty)" == "1" ]]
    then
        echo '41m'
    else
        echo '44m'
    fi
}

git_prompt() {
  local ref=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  if [ "$ref" != "" ]
  then
    echo $ref
  fi
}

get_current_directory() {
    current_dir=`echo "${PWD#$HOME}" | sed 's/\//\ >\ /g'`
    if [[ -z "$current_dir" ]]; then
        echo ""
    else
        echo "${current_dir}"
    fi
}

function parse_git_dirty {
    [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo 1 # " | <U+2B60>" $(git status | grep 'modified:' | wc -l)
}
