#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in ${DIR}/build.*.properties
do
	ant -propertyfile $file clean compile || exit $?
done

ant package
