#!/bin/bash

function build_core() {
	shopt -s globstar
	for d in ./*/ ; do
		cd "$d"
		echo " "
		echo "[!]: Building ${d}"
		$@
		rm -rf src/
		rm -rf pkg/
		cd ..
	done
}

build_core "makepkg --skipint"
