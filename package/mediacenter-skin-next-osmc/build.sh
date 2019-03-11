# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

make clean

REV="541794126e426f7cc65c3f3bf8f929104d0b4b3d"
echo -e "Building package mediacenter-skin-osmc"
echo -e "Downloading skin"
pull_source "https://github.com/osmc/skin.osmc/archive/${REV}.tar.gz" "$(pwd)/src"
if [ $? != 0 ]; then echo -e "Error downloading" && exit 1; fi
pushd src/skin.osmc-*
install_patch "../../patches" "all"
popd
echo -e "Moving files in to place"
mkdir -p files/usr/share/kodi/addons
cp -ar src/skin.osmc-${REV}/ files/usr/share/kodi/addons/skin.osmc
if [ -f files/usr/share/kodi/addons/skin.osmc/media/Textures.xbt ]
then
    echo "TexturePacked file detected, deleting unneeded artefacts"
    pushd files/usr/share/kodi/addons/skin.osmc/media
    find . ! -name 'Textures.xbt' -delete
    popd
fi

pull_source "https://github.com/kodi-community-addons/script.skin.helper.service/archive/master.zip" "$(pwd)/src"
cp -ar src/script.skin.helper.service-master files/usr/share/kodi/addons/script.skin.helper.service

pull_source "https://github.com/kodi-community-addons/script.skin.helper.skinbackup/archive/master.zip" "$(pwd)/src"
cp -ar src/script.skin.helper.skinbackup-master files/usr/share/kodi/addons/script.skin.helper.skinbackup

pull_source "https://github.com/kodi-community-addons/script.skin.helper.widgets/archive/master.zip" "$(pwd)/src"
cp -ar src/script.skin.helper.widgets-master files/usr/share/kodi/addons/script.helper.widgets

pull_source "https://github.com/kodi-community-addons/script.skinshortcuts/archive/master.zip" "$(pwd)/src"
cp -ar src/script.skinshortcuts-master files/usr/share/kodi/addons/script.skinshortcuts


dpkg_build files/ mediacenter-skin-osmc.deb
