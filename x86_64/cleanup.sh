#!/bin/bash

remove_leftovers() {
    iam=$1

    cd $@

    set +e
    echo " "
    echo "[*]: Moving $iam pkgs to proper place"
    mv */*pkg.t* ../../pkgs/$iam/ &> /dev/null
    set -e
    echo "[*]: Cleaning up $iam"

    rm -rf */pkg/ */src/ */*pkg* */*xz* */*tar.gz */*tar.bz2 */*.zip */*/ */*tgz */*tar.zst */*sign* */*sig* */*asc*

    cd ..
}

remove_kde_leftovers() {
    iam=$1

    cd $@

    set +e
    echo " "
    echo "[*]: Moving $iam pkgs to proper place"
    mv */*/*pkg.t* ../../pkgs/$iam/ &> /dev/null
    set -e
    echo "[*]: Cleaning up $iam"

    rm -rf */*/pkg/ */*/src/ */*/*pkg* */*/*xz* */*/*tar.gz */*/*tar.bz2 */*/*.zip */*/*/ */*/*tgz */*/*tar.zst */*/*sign* */*/*sig* */*/*asc*

    cd ..
}

set -e

remove_leftovers core
remove_leftovers cross_tools
remove_leftovers extra
remove_leftovers extra32
remove_leftovers games
remove_leftovers layers
remove_leftovers pentest
remove_leftovers perl
remove_leftovers proprietary
remove_leftovers python
remove_leftovers server
remove_leftovers xfce
remove_leftovers gnome
#remove_kde_leftovers kde

echo " "
echo "[*]: Done"
