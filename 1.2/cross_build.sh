#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /tmp

git clone --depth=1 https://github.com/kwhat/jnativehook
cd jnativehook

ant compile-jnitasks compile-java bootstrap-libuiohook

for file in ${DIR}/build.*.properties
do
	rm -Rvf ./bin/libuiohook ./bin/jni
	
	ant -propertyfile $file compile-libuiohook compile-jni || exit $?
done

ant package
