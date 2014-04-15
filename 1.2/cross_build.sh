#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd /tmp

if [ ! -d jnativehook ]; then
	git clone --depth=1 https://github.com/kwhat/jnativehook
fi

cd jnativehook

ant distclean download-jnitasks download-libuiohook

# Fix github clock skew
find ./src/libuiohook -exec touch {} \;
find ./src/jnitasks -exec touch {} \;

ant compile-jnitasks compile-java bootstrap-libuiohook

for file in ${DIR}/build.*.properties
do
	rm -Rvf ./bin/libuiohook ./bin/obj ./bin/lib
	ant -propertyfile $file compile-libuiohook compile-jni || exit $?
done

ant package
