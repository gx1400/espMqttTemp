print("Running roomconfig.lua...")
dofile("roomconfig.lua")

print("delay 1 seconds...")
tmr.delay(5000)

print("Running mqtt_connect.lua...")
dofile("mqtt_connect.lua")
