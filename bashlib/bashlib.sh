
TRUE=0
FALSE=1

MAC_UNAME="Darwin"

SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"

isMac ()
{
	if [[ $(uname -s) == "Darwin" ]]; then return $TRUE
	else return $FALSE
	fi
}

scriptDir () {
	echo "$(dirname ${BASH_SOURCE[0]})"
}