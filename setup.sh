#!/bin/bash

FROM="$(dirname "$0")"
TARGET=${1-$HOME}

OS="unknown"
case "$OSTYPE" in
	darwin*)	OS="osx" ;;
	linux*)		OS="linux" ;;
	*)		OS="UNKNOWN" ;;
esac

if [ "$OS" = "UNKNOWN" ]; then
	echo " !!! Unknown OS: $OSTYPE"
	exit 1
fi

symlink_work () {
	if [ -e "$2" ]; then
		echo " ---> SKIPPING: $1"
	fi

	ln -s "$1" "$2"
}

symlink_files () {
	if [ ! -d "$2" ]; then
		mkdir -p "$2"
	fi

	for file in "$1"/*; do
		symlink_work "$1"/"$file" "$2"/"$file"
	done

	for file in "$1"/.*; do
		if [ "$file" = "$1"/"." ]; then
			continue
		fi

		if [ "$file" = "$1"/".." ]; then
			continue
		fi

		symlink_work "$1"/"$file" "$2"/"$file"
	done
}


echo ""
echo " *** Shell Setup *** "
echo ""
echo " *** FROM: $FROM"
echo " *** TARGET: $TARGET"
echo ""

exit

symlink_files "$FROM" "$TARGET"

echo ""
