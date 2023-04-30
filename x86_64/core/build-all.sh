folders=(*/)

function build_extras_S() {
        shopt -s globstar
        for d in ${folders[@]} ; do
		if [ -f "${d}/$pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.gz" ]; then
			echo "Skipping $d"
                else
			if [ -f "$d/PKGBUILD" ]; then
				echo "Compiling $d"
				cd "$d"
				source PKGBUILD
				sudo kelper -Sydd $depends --overwrite=* --noconfirm --needed
				$@
                		rm -rf src/
                		rm -rf pkg/
				sudo kelper -Udd ../*/*.pkg.tar* --noconfirm --overwrite="*" &> /dev/null
                		cd ..
			else
				echo "Not a package, or missing PKGBUILD"
			fi
		fi
        done
}

build_extras_S "makepkg --skipint --noconfirm -C"
