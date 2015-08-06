#!/bin/bash

OK=0

SCRIPT_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
BACKUP_DIR=${HOME}/.backpack.backup
RC_DIR=${SCRIPT_DIR}/rc

# Ignore current and paren dirs when globbing
GLOBIGNORE=".:.."

mkdir $BACKUP_DIR
backupResult=$?

if [[ $backupResult -ne $OK ]]; then
	echo "Backup already exists in ${BACKUP_DIR}"
	exit $backupResult
fi

echo "Backing up homedir files to ${BACKUP_DIR}"
for f in ${RC_DIR}/*; do
	echo "mv ${HOME}/$(basename $f) ${BACKUP_DIR}/$(basename $f)"
	mv ${HOME}/$(basename $f) ${BACKUP_DIR}/$(basename $f)
done

echo
echo "Installing symlinks in homedir"
for f in ${RC_DIR}/*; do
	echo "ln -s $f ${HOME}/$(basename $f)"
	ln -s $f ${HOME}/$(basename $f)
done