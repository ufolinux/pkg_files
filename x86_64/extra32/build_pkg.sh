#!/bin/bash

folders=(lib32-*)

function build_extras_S() {
        shopt -s globstar
        for d in ${folders[@]} ; do
                cd "$d"
                $@
                rm -rf src/
                rm -rf pkg/
                cd ..
        done
}

build_extras_S "makepkg --skipint -C -c -s"

#function build_extras() {
#        shopt -s globstar
#        for d in font* ; do
#                cd "$d"
#                $@
#                rm -rf src/
#                rm -rf pkg/
#                cd ..
#        done
#}

#build_extras "makepkg --skipint"
