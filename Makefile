all: tc_gui

tc_gui: tc_gui.c
	gcc tc_gui.c -o tc_gui `pkg-config --cflags --libs gtk+-2.0`
	chmod 755 tc_gui

install:
	sudo apt-get install -y xkeycaps
	sudo install -d -m 755 /usr/share/tc_gui
	sudo install -d -m 755 /usr/share/doc/tc_gui
	sudo install -m 755 tc_gui /usr/bin
	sudo install -m 664 tc_gui.ui /usr/share/tc_gui
	sudo install -m 644 copyright /usr/share/doc/tc_gui
	sudo install -m 664 tc_gui.desktop /usr/share/applications

uninstall:
	sudo rm -f /usr/bin/tc_gui
	sudo rm -f /usr/share/tc_gui -R
	sudo rm -f /usr/doc/tc_gui -R
	sudo rm -f /usr/share/applications/tc_gui.desktop

clean:
	rm -f tc_gui
