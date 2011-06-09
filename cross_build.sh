#!/bin/sh

for file in ./build.properties.*
do
	ant clean
	ant -propertyfile $file compile
done

ant package
