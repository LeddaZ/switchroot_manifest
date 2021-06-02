#!/bin/bash

# snack
# Thomas Makin <halorocker89@gmail.com>

# I don't feel like messing with other scripts for development
# so here's a nice lil script to prep everything

# Apply repopicks--CREDIT @PabloZaiden
# https://github.com/PabloZaiden/switchroot-android-build/blob/master/build-scripts/repopic-and-patch.sh

function applyRepopicks {
    REPOPICKS_FILE=$1
    echo "Applying repopicks from $REPOPICKS_FILE"

    cd $ANDROID_BUILD_TOP
    while IFS= read -r line; do
        if [[ ${line:0:1} == "\"" ]];
        then
            echo "Picking topic: $line"
            eval "$ANDROID_BUILD_TOP/vendor/lineage/build/tools/repopick.py -t $line"
        else
            echo "Picking: $line"
            eval "$ANDROID_BUILD_TOP/vendor/lineage/build/tools/repopick.py $line"
        fi

    done < $REPOPICKS_FILE
}

# Apply patched--CREDIT @PabloZaiden
# https://github.com/PabloZaiden/switchroot-android-build/blob/master/build-scripts/repopic-and-patch.sh

function applyPatches {
    PATCHES_FILE=$1
    echo "Applying patches from $PATCHES_FILE"

    while read -r line; 
    do
        IFS=',' read -r -a parts <<< "$line"

        if [[ "${parts[2]}" == "git" ]]; 
        then
            echo "Applying patch ${parts[0]} with git am"
            eval "git -C ${ANDROID_BUILD_TOP}/${parts[1]} am ${PATCHDIR}/${parts[0]}"
            cd $ANDROID_BUILD_TOP
        else
            echo "Applying patch ${parts[0]} with Unix patch utility"
            eval "patch -p1 -d ${ANDROID_BUILD_TOP}/${parts[1]} -i ${PATCHDIR}/${parts[0]}"
        fi
    done < $PATCHES_FILE
}

function prep {
    export PATCHDIR=$ANDROID_BUILD_TOP/.repo/local_manifests/patches

    if [[ -z $MANIFEST ]];
    then
        git -C $ANDROID_BUILD_TOP/.repo/local_manifests pull
    fi

    repo forall -c 'git clean -dxf'
    repo forall -c 'git reset --hard'

    if [[ -z $SYNC ]];
    then
        read -p "Would you like to sync? " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo "Syncing..."
            repo sync --force-sync
        fi
    elif [[ $SYNC == true ]];
    then
        echo "Syncing..."
        repo sync --force-sync
    fi
}

# ENTRY

for arg in "$@"
do
    if [[ "$arg" == "-y" ]];
    then
        echo "Will sync when ready."
        SYNC=true
    fi
    if [[ "$arg" == "-n" ]];
    then
        echo "Will not sync."
        SYNC=false
    fi
    if [[ "$arg" == "--no-pull" ]];
    then
        echo "Will not pull latest manifest."
        MANIFEST=false
    fi
done

if [[ -z $ANDROID_BUILD_TOP ]];
then
    echo "ANDROID_BUILD_TOP not found...assuming PWD"
    source build/envsetup.sh
elif [[ $ANDROID_BUILD_TOP != $PWD ]];
then
    echo "ANDROID_BUILD_TOP is not PWD--watch out!"
fi

prep
applyRepopicks $ANDROID_BUILD_TOP/.repo/local_manifests/picks
applyPatches $ANDROID_BUILD_TOP/.repo/local_manifests/patches/patches
