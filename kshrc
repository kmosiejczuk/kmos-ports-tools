# I got this magic string from the par(1) man page
export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'

export CVSROOT=anoncvs@filedump.se.rit.edu:/cvs

# Some machines I work on have a symlink from /usr/ports to /home/ports
# Works in 99.9% of cases, but setting this to where it really is makes
# it work in 100% of cases
#export PORTSDIR=/home/ports

# Useful when snapshots think they are release
export PKG_ADD="/usr/sbin/pkg_add -Dsnap"

alias portsql='sqlite3 /usr/local/share/sqlports'
alias portslol='make 2>&1 | /usr/ports/infrastructure/bin/portslogger .'
alias port-pldc='make port-lib-depends-check'
alias port-ldc='make lib-depends-check'
alias port-pdiff='diff -up pkg/PLIST.orig pkg/PLIST'
alias portsrc='cd `make show=WRKSRC`'
alias port-fast='MAKE_JOBS=4 make'
alias orig-clean='rm *.orig */*.orig'

# To cleanup both flavors of a python port
alias cleanup='make clean=all && env FLAVOR=python3 make clean=all'

# My most frequently used alias
alias py3='env FLAVOR=python3'

alias ls="ls -F"

# Generates a patch for the whole port into /usr/ports/mystuff
port-diff() { cvs diff > /usr/ports/mystuff/${PWD##*/}.diff  ; less /usr/ports/mystuff/${PWD##*/}.diff ;}

port-lessdiff() { less /usr/ports/mystuff/${PWD##*/}.diff  ; }

# greps all Makefiles in ports tree for the supplied term
port-grep() { (cd /usr/ports; grep "$@" */*/Makefile */*/*/Makefile ) ;}

# Only greps Makefiles in ports directories that start with py-
port-pygrep() { (cd /usr/ports; grep "$@" */*/py-*/Makefile */py-*/Makefile ) ;}

portsfind() { find /usr/ports -iname "${1}" -exec grep -iH ${2} {} \; ;}

function vibak { for i; do [ -f "$i.orig" ] || doas -u _pbuild cp "$i" "$i.orig"; done; doas -u _pbuild env HOME=/home/pbuild ${EDITOR:-/usr/bin/vi} "$@" ; }
