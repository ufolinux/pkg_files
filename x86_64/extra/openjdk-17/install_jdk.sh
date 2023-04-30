# Feel free to improve everything here
# This is just quick and lazy way to install binaries right now

post_install() {
	if [ ! -f /usr/bin/java ]; then
		echo "[+]: Linking java binaries from /opt/jdk-17/bin/ to /usr/bin/"
		ln -sf /opt/jdk-17/bin/* /usr/bin/
	else
		echo "[+]: Java binaries seem to be linked to /usr/bin/ already"
		return
	fi

	# Settting up the JRE Certificate Authority Certificates
	# ln -sfv /etc/pki/tls/java/cacerts /opt/jdk/lib/security/cacerts
}

pre_remove() {
	cd /usr/bin

	# Remove all java blobs
	rm -f jar javadoc jdb jhsdb jmap jrunscript jstatd jarsigner javap jdeprscan jimage	\
	jmod jshell keytool java jcmd jdeps jinfo jpackage jstack rmiregistry javac 		\
	jconsole jfr jlink jps jstat serialver

	# Remove JRE Certs link
	# rm /opt/jdk/lib/security/cacerts
}
