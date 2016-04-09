#!/bin/sh

test -e "$2" && exit 0

type wget >/dev/null 2>&1 && wget -O "$2" "$1" && exit 0
type curl >/dev/null 2>&1 && curl "$1" > "$2" && exit 0
type php >/dev/null 2>&1 && php -r "readfile('$1');" > "$2" && exit 0
type fetch >/dev/null 2>&1 && fetch -o "$2" "$1" && exit 0

echo "Please install wget, curl or php."
exit 1
