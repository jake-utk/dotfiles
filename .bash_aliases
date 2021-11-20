alias ufw:up="sudo ufw enable"
alias vpn="sudo protonvpn"
alias vpn:status="sudo protonvpn s"
alias vpn:up="sudo protonvpn connect -f"
alias vpn:down="sudo protonvpn disconnect"
alias vpn:refresh="vpn:down && vpn:up"
alias sysch="echo 'Checking vpn...' && sudo protonvpn s | grep Status: && echo 'Checking firewall...' && sudo ufw status | grep Status:"
alias sandbox="code ~/dev/sandbox"
alias dotfiles='/usr/bin/git --git-dir=/home/jake/.dotfiles/ --work-tree=/home/jake'
alias audio-devices='pactl list sinks | grep "Sink #\|Ports\|analog-ou" -A 3'