proc sendline { x } {
    send $x
    send "\r"
}

proc simh { cmd } {
    expect "sim>"
    sendline $cmd
}

proc optional_simh { exp cmd } {
    expect {
        $exp   { sendline $cmd }
        "sim>" { sendline "" }
    }
}

proc bsd { cmd } {
    expect "# "
    sendline $cmd
}

proc unix { cmd } {
    expect "# "
    sendline $cmd
}

proc v8 { cmd } {
    expect "\$ "
    sendline $cmd
}

proc respond { w r } {
    expect $w
    send $r
}

set timeout -1
set ctrlD "\x04"
set break "\x05"
