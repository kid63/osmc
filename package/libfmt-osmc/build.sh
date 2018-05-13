# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

pull_source "http://mirrors.kodi.tv/build-deps/sources/fmt-3.0.1.tar.gz" "$(pwd)/src"
if [ $? != 0 ]; then echo -e "Error downloading" && exit 1; fi
# Build in native environment
build_in_env "${1}" $(pwd) "libfmt-osmc"
build_return=$?
if [ $build_return == 99 ]
then
	echo -e "Building libfmt"
	out=$(pwd)/files
	if [ -d files/usr ]; then rm -rf files/usr; fi
	sed '/Package/d' -i files/DEBIAN/control
	sed '/Depends/d' -i files/DEBIAN/control
        VERSION_DEV=$(grep Version ${out}/DEBIAN/control)
        VERSION_NUM=$(echo $VERSION_DEV | awk {'print $2'})
	update_sources
	echo "Package: ${1}-libfmt-osmc" >> files/DEBIAN/control 
	pushd src/fmt-*
        cmake -DCMAKE_INSTALL_PREFIX=/usr/osmc/ -DFMT_DOC=OFF -DFMT_INSTALL=ON -DFMT_TEST=OFF -DFMT_USE_CPP11=ON .
	$BUILD
	make install DESTDIR=${out}
	if [ $? != 0 ]; then echo "Error occured during build" && exit 1; fi
	strip_files "${out}"
	popd
	fix_arch_ctl "files/DEBIAN/control"
	dpkg_build files ${1}-libfmt-osmc.deb
	build_return=$?
fi
teardown_env "${1}"
exit $build_return
