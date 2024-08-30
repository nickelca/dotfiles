strength_exact=0
sleep_pid=0

toggle() {
    strength_exact=$(((strength_exact + 1) % 2))

    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid >/dev/null 2>&1
    fi
}

trap "toggle" USR1


while true; do
    dev=$(ip --json route get 192.168.0.1 | jq -r '.[0].dev')
    network_name=$(nmcli -g GENERAL.CONNECTION device show $dev)
    connection_strength=$(nmcli -t -f SSID,SIGNAL dev wifi list | grep "^$network_name:" | cut -d : -f 2)

    if [[ $strength_exact -eq 1 ]]; then
        echo $network_name "($connection_strength%)"
    else
        symbol="!"
        if [[ $connection_strength -gt 80 ]]; then
            symbol="*"
        elif [[ $connection_strength -gt 50 ]]; then
            symbol="~"
        elif [[ $connection_strength -gt 20 ]]; then
            symbol="-"
        fi
        echo $network_name $symbol
    fi

    sleep 5 &
    sleep_pid=$!
    wait
done
