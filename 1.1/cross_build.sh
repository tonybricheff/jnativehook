#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ant deep-clean compile-java

for file in ${DIR}/build.*.properties
do
	rm -Rvf ./bin/obj/ ./build.properties
	ant -propertyfile $file compile-native strip-native || exit $?
done

ant package
