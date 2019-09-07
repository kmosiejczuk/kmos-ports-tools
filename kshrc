export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'
export CVSROOT=anoncvs@filedump.se.rit.edu:/cvs
#export PORTSDIR=/home/ports

alias portsql='sqlite3 /usr/local/share/sqlports'
alias portslol='make 2>&1 | /usr/ports/infrastructure/bin/portslogger .'
alias port-pldc='make port-lib-depends-check'
alias port-ldc='make lib-depends-check'
alias port-pdiff='diff -up pkg/PLIST.orig pkg/PLIST'
alias portsrc='cd `make show=WRKSRC`'
alias port-fast='MAKE_JOBS=4 make'
alias cleanup='make clean=all && env FLAVOR=python3 make clean=all'
alias py3='env FLAVOR=python3'

alias ls="ls -F"

port-diff() { cvs diff > /usr/ports/mystuff/${PWD##*/}.diff  ; less /usr/ports/mystuff/${PWD##*/}.diff ;}
port-lessdiff() { less /usr/ports/mystuff/${PWD##*/}.diff  ; }
port-grep() { (cd /usr/ports; grep "$1" */*/Makefile */*/*/Makefile ) ;}
port-pygrep() { (cd /usr/ports; grep "$1" */py-*/Makefile ) ;}
portsfind() { find /usr/ports -iname "${1}" -exec grep -iH ${2} {} \; ;}

function vibak { for i; do [ -f "$i.orig" ] || doas -u _pbuild cp "$i" "$i.orig"; done; doas -u _pbuild env HOME=/home/pbuild $EDITOR "$@" ; }
