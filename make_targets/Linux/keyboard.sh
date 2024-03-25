	if [[ -f /etc/udev/rules.d/50-zsa.rules ]]; then
		echo "[keyboard]: Already installed";
	else
		echo "[keyboard]: Keymapp not installed, setting up";
		sudo apt install libusb-1.0-0-dev;
		sudo cp ./keyboard/50-zsa.rules /etc/udev/rules.d/50-zsa.rules;
		sudo groupadd plugdev;
		sudo usermod -aG plugdev $$USER;
		curl -L https://oryx.nyc3.cdn.digitaloceanspaces.com/keymapp/keymapp-latest.tar.gz | tar -xz -C ~/.local/bin;
		chmod +x ~/.local/bin/keymapp;
	fi;
