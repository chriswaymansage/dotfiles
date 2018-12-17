# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Set title to "Peppermint Terminal"
#PROMPT_COMMAND='echo -ne "\033]0;Peppermint Terminal\007"'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DIR/bash_aliases"
source "$DIR/bash_profile"
source "$DIR/bash_prompt"
