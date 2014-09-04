#!/usr/bin/expect -f
set timeout 30
set host [lindex $argv 0]
set passwd [lindex $argv 1]
set port [lindex $argv 2]
set oa	[lindex $argv 3]
#set kk PROMPT_COMMAND=\'printf \"\033]0\;%s@%s\:%s\007\" \"${USER}\" \"ss_${HOSTNAME%%.*}\" \"${PWD/#$HOME/~}\"\'
spawn ssh  root@$host -p $port $oa
expect {

"yes/no" { send "yes\r";exp_continue }

"password:" { send "$passwd\r" }
}

#expect "#" {send "PROMPT_COMMAND=\'printf \"\033]0\;%s@%s\:%s\007\" \"${USER}\" \"ss_${HOSTNAME%%.*}\" \"${PWD/#$HOME/~}\"\'\r"}
interact

