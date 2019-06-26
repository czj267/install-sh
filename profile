alias c='cd /mnt/c'
alias pro='cd /mnt/c/project'
alias ci='cnpm install --save'
alias proxy='export http_proxy="local:1080" https_proxy="local:1080"'
alias unproxy='export http_proxy="" https_proxy=""'




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

umask 002
