#!/usr/bin/env bash
if ! command -v nmcli >/dev/null 2>&1
then
    echo "'nmcli' could not be found"
    exit 1
fi

print_help(){
    printf 'Command Usage\n'
    printf '\t%s [Options]\n' '$0'
    printf '\nOptions\n'
    printf '\t-h, --help     : Print Help\n'
    printf '\t-l, --list     : List WiFi Networks\n'
    printf '\t-r, --rescan   : Rescan WiFi\n'
    printf '\t-R, --reconnect: Reconnect WiFi\n'
    printf '\t-c, --connect  : Connect to WiFi\n'


}

parse_commandline(){
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
            -h|--help)
                print_help
                exit 0
                ;;
            -l|--list)
                nmcli device wifi list
                exit 0
                ;;
            -r|--rescan)
                nmcli device wifi rescan
                ;;
            -R|--reconnect)
                if [ $HOSTNAME == "HP" ];then
                    nmcli device disconnect wlp3s0
                    nmcli device connect wlp3s0
                else
                    nmcli device disconnect wlo1
                    nmcli device connect wlo1
                fi
                ;;
            -c|--connect)
                # Get list of SSID and SECURITY
                mapfile -t wifi_list < <(nmcli -t -f SSID,SECURITY device wifi list | grep -v '^$')
                if [ ${#wifi_list[@]} -eq 0 ]; then
                    echo "No WiFi networks found."
                    exit 1
                fi

                echo "Available WiFi Networks:"
                ssids=()
                securities=()
                for i in "${!wifi_list[@]}"; do
                    ssid=$(echo "${wifi_list[$i]}" | cut -d: -f1)
                    sec=$(echo "${wifi_list[$i]}" | cut -d: -f2)
                    ssids+=("$ssid")
                    securities+=("$sec")
                    printf "%d) %s [%s]\n" $((i+1)) "$ssid" "$sec"
                done

                read -p "Select network (1-${#ssids[@]}): " choice
                if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#ssids[@]}" ]; then
                    echo "Invalid selection."
                    exit 1
                fi

                selected_ssid="${ssids[$((choice-1))]}"
                selected_sec="${securities[$((choice-1))]}"

                if [ -n "$selected_sec" ] && [ "$selected_sec" != "--" ]; then
                    read -s -p "Enter password for '$selected_ssid': " wifi_pass
                    echo
                    nmcli device wifi connect "$selected_ssid" password "$wifi_pass"
                else
                    nmcli device wifi connect "$selected_ssid"
                fi
                exit 0
                ;;
            *)
                _last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
        esac
        shift
    done
}

parse_commandline "$@"

