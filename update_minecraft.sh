#!/bin/bash

set -e
# set -x

echo "+ Getting md5sum..."
md5sum=$(md5sum ~/.minecraft/bin/minecraft.jar | awk '{print $1;}')

# Backup minecraft jar
echo "+ Backing up minecraft.jar..."
echo cp -v ~/.minecraft/bin/minecraft.jar ~/.minecraft/bin/minecraft.jar.${md5sum}

# Unzip minecraft jar
echo "+ Unzipping minecraft.jar..."
rm -rf ~/.minecraft/bin/t
mkdir -p ~/.minecraft/bin/t
cd ~/.minecraft/bin/t
unzip -o -q ../minecraft.jar

# Install latest modloader
echo "+ Installing latest modloader..."
modloader=~/download/minecraft/ModLoader.zip
unzip -o -q ${modloader}

# Install latest optifine
echo "+ Installing latest optifine..."
optifine=$(ls -1 ~/download/minecraft/OptiFine*.zip | tail -1)
cd ~/.minecraft/bin/t
unzip -o -q ${optifine}

# Install latest cjb
echo "+ Installing latest cjb..."
cjb=$(ls -1 ~/download/minecraft/CJBMods*.zip | tail -1)
rm -rf ~/.minecraft/bin/cjb
mkdir -p ~/.minecraft/bin/cjb
cd ~/.minecraft/bin/cjb
unzip -o -q ${cjb}
cp -r "Put in Minecraft Folder"/* ~/.minecraft
cp -r "Put in minecraft.jar - FOR XRAY ONLY"/* ~/.minecraft/bin/t

# Remove META-INF
echo "+ Removing META-INF..."
cd ~/.minecraft/bin/t
rm -f META-INF/*

# Now update minecraft.jar
echo "+ Updating minecraft.jar..."
cd ~/.minecraft/bin/t
jar cf ../minecraft.jar *

echo "done."

