#!/bin/bash

set -e
# set -x

DOWNLOADS=~/download/minecraft

echo "+ Getting md5sum..."
md5sum=$(md5sum ~/.minecraft/bin/minecraft.jar | awk '{print $1;}')

# Backup minecraft jar
echo "+ Backing up minecraft.jar..."
cp -v ~/.minecraft/bin/minecraft.jar ~/.minecraft/bin/minecraft.jar.${md5sum}

# Unzip minecraft jar
echo "+ Unzipping minecraft.jar..."
rm -rf ~/.minecraft/bin/t
mkdir -p ~/.minecraft/bin/t
cd ~/.minecraft/bin/t
unzip -o -q ../minecraft.jar

# Install latest modloader
echo "+ Installing latest modloader..."
modloader=~/download/minecraft/ModLoader.zip
unzip -o -q "${modloader}"

# Install latest optifine
echo "+ Installing latest optifine..."
optifine=$(ls -1 $DOWNLOADS/OptiFine*.zip | sort | tail -1)
cd ~/.minecraft/bin/t
unzip -o -q "${optifine}"

# Install latest Player API
echo +"Installing latest Player API"
playerapi=$(ls -1 $DOWNLOADS/MC*Player?API?universal*.zip | sort | tail -1)
cd ~/.minecraft/bin/t
unzip -o -q "${playerapi}"

# Install latest cjb
echo "+ Installing latest cjb..."
cjb=$(ls -1 $DOWNLOADS/CJBMods*.zip | sort | tail -1)
rm -rf ~/.minecraft/bin/cjb
mkdir -p ~/.minecraft/bin/cjb
cd ~/.minecraft/bin/cjb
unzip -o -q ${cjb}
cp -r "Put in Minecraft Folder"/* ~/.minecraft
cd ~/.minecraft/bin/t
unzip -o -q ~/.minecraft/bin/cjb/"Put in minecraft.jar - FOR XRAY ONLY"/CJB_XRAY_CLASSES.zip

# Disable some cjb mods
mkdir -p ~/.minecraft/mods-disabled
mv ~/.minecraft/mods/CJB_QUICKCRAFT.zip ~/.minecraft/mods-disabled
mv ~/.minecraft/mods/CJB_MEASURES.zip ~/.minecraft/mods-disabled

# Remove META-INF
echo "+ Removing META-INF..."
cd ~/.minecraft/bin/t
rm -f META-INF/*

# Now update minecraft.jar
echo "+ Updating minecraft.jar..."
cd ~/.minecraft/bin/t
jar cf ../minecraft.jar *

echo "done."

