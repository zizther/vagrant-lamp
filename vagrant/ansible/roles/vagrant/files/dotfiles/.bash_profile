alias ls='ls -lah'

gitdiff()
{
    git diff "${@}" | vi -
}
# Git create release
gitrl()
{
    git co develop;
    git pull;
    git co -b releases/$1;
    git push --set-upstream origin releases/$1;
    git co develop
}
# Git create feature
gitft()
{
    git co develop;
    git pull;
    git co -b features/$1;
    git push --set-upstream origin features/$1;
}
# Git refresh
gitrf()
{
    git co master;
    git pull;
    git co develop;
    git merge master;
    git push;
}
# Git clean local branches
gitcl()
{
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d; git fetch -p origin; git br;
}

BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"

PS1="$GREEN"'\w'"$RED"'$(__git_ps1)'"$BLACK"' \$ '

export PS1
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

cd /var/www/
