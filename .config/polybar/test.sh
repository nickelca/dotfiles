t=1
inc=1
sleep_pid=0

toggle() {
    if [[ $inc -eq 1 ]]; then
        t=$((t + 1))
    else
        t=$((t - 1))
    fi
    if [[ $t -eq 1 ]]; then
        inc=1
    elif [[ $t -eq 3 ]]; then
        inc=0
    fi

    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid >/dev/null 2>&1
    fi
}

trap "toggle" USR1

while true; do
    echo $t
    sleep 1 &
    sleep_pid=$!
    wait
done


