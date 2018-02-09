# Export all env variables in my laptop
# v.0.1alpha


# Backupd section (using duplicity)
export AWS_ACCESS_KEY_ID='ACCESS_KEY'
export AWS_SECRET_ACCESS_KEY='SECRET_key'
# gpg pub key
export GPG_KEY='1FCA0620'
export GPG_SIGN_KEY='C66B3D3F'

## ZSH EXPORT SETTINGS ##
export KEYTIMEOUT=1
export SSH_ASKPASS=''
export VISUAL="vim"
export EDITOR="vim"
export BROWSER=w3m
export GOPATH=$HOME/golang-book
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin":$GOPATH/bin:$HOME/.cargo/bin
export GPG_TTY=$(tty)
export LC_COLLATE=en_US.UTF-8
export LANG=en_US.UTF-8
#export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -c 'nm q <Esc>:q<CR>' - \""
export TERM=xterm-256color
