#!/bin/sh

for file in ./build.properties.*
do
	ant -propertyfile $file clean compile
done

ant package
