# espMqttTemp
esp8266 (via WEMOS Mini D1) temperature mqtt loggers with DH11/22

Connect esp8266 to PC and find COM port number (Device manager in windows).  In my case it was COM3

check connection with:

```
esp.py --port COM3 read_mac
```

Load firmware with:

```
esptool.py --port COM3 write_flash 0x00000 nodemcu-master-9-modules-2017-05-02-19-35-55-float.bin
```

1) update credentials.lua with your ssid and password.
2) change roomconfig.lua to suit your needs
3) open esploser and load files.
