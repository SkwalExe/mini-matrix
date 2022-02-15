all: copy

copy:
	sudo cp mini-matrix.sh /bin/mini-matrix
	sudo chmod 755 /bin/mini-matrix

uninstall:
	sudo rm -f /bin/mini-matrix
