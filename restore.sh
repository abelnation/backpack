#!/bin/bash

BACKUP_DIR=${HOME}/.backpack.backup

if [ ! -d ${BACKUP_DIR} ]; then
	echo "Backdir does not exist.  No files to restore."
	echo "${BACKUP_DIR}"
	exit 1
fi

# Ignore current and paren dirs when globbing
GLOBIGNORE=".:.."

echo "Restoring files from ${BACKUP_DIR} to homedir"
for f in ${BACKUP_DIR}/*; do
	echo "rm -r ${HOME}/$(basename $f)"
	rm -r ${HOME}/$(basename $f)
	
	echo "cp -r ${f} ${HOME}/"
	cp -r ${f} ${HOME}/
done

echo "Removing backup dir"
rm -rf ${BACKUP_DIR}