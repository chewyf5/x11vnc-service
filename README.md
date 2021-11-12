# x11vnc-service

X11Vnc auf Raspberry Pi as Systemd service starten 

# Credentials

``` 
sudo x11vnc -storepasswd /etc/x11vnc.pass
```

# Aktivieren

```
sudo systemctl enable x11vnc.service
```

## x11 als autostart NACH!!! user login 

x11 als autostart desktop file

# Quellen

* https://www.elektronik-kompendium.de/sites/raspberry-pi/2011121.htm
