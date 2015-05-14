#!/bin/bash

# http://stackoverflow.com/questions/3572030/bash-script-absolute-path-with-osx
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

FROM=$(realpath "$0")
FROM=$(dirname "$FROM")
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
		echo " !!!> SKIPPING: $2"
	else
		echo " ---> Symlink: $2"
		ln -s "$1" "$2"
	fi
}

symlink_files () {
	if [ ! -d "$2" ]; then
		mkdir -p "$2"
	fi

	for file in "$1"/*; do
		if [ "$file" = "$1"/"*" ]; then
			continue
		fi

		just_file=$(basename $file)
		symlink_work "$file" "$2"/"$just_file"
	done

	for file in "$1"/.*; do
		if [ "$file" = "$1"/"*" ]; then
			continue
		fi

		if [ "$file" = "$1"/"." ]; then
			continue
		fi

		if [ "$file" = "$1"/".." ]; then
			continue
		fi

		just_file=$(basename $file)
		symlink_work "$file" "$2"/"$just_file"
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
