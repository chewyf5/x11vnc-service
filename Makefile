.PHONY: default
default: help;
install: systemd;

DESKTOP_FILE=x11vnc.desktop
SERVICE_FILE=x11vnc.service
AUTOSTART_FOLDER=/home/pi/.config/autostart/
SYSTEMD_FOLDER=/etc/systemd/system/

autostart:
	### copy to autostart folder
	cp $(DESKTOP_FILE) $(AUTOSTART_FOLDER)$(DESKTOP_FILE)
	#########################################################
	# Create vnc password with                              #
	# sudo x11vnc -storepasswd /home/pi/.vnc/passwd         #
	#########################################################

systemd:
	### copy service to /etc/systemd/system folder
	cp $(SERVICE_FILE) $(SYSTEMD_FOLDER)$(SERVICE_FILE)
        #########################################################
        # Create vnc password with                              #
        # sudo x11vnc -storepasswd /etc/x11vnc.pass             #
        #########################################################
	systemctl daemon-reload
	systemctl enable $(SERVICE_FILE)

help:
	### Install Systemd service
	# sudo make systemd   `or`  sudo make install
	#
	### Install Autostart
	# sudo make autostart
	#
	### Uninstall
	# sudo make uninstall
	#

uninstall:
	rm -f $(AUTOSTART_FOLDER)$(DESKTOP_FILE)
	rm -f $(SYSTEMD_FOLDER)$(SERVICE_FILE)
	systemctl disable $(SERVICE_FILE) || true
	systemctl daemon-reload



