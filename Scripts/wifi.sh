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
                nmcli device disconnect wlo1
                nmcli device connect wlo1
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

