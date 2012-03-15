#!/bin/sh

for file in ./build.properties.*
do
	ant -propertyfile $file clean compile || exit $?
done

ant package
