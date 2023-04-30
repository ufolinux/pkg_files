#!/bin/bash

function build_core() {
	shopt -s globstar
	for d in ./*/ ; do
		cd "$d"
		echo " "
		echo "[!]: Building ${d}"
		$@
		cd ..
	done
}

build_core "makepkg"
