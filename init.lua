dofile("credentials.lua")

function startup()
    if file.open("init.lua") == nil then
        print("init.lua not detected")
    else
        print("running...")
        file.close("init.lua")
        dofile("application.lua")
    end
end


print("Connecting to wifi....")
wifi.setmode(wifi.STATION)
wifi.sta.config(SSID, PASSWORD)

tmr.create().alarm(1, 1000, 1, function()
    if wifi.sta.getip() == nil then
       print("Waiting for IP Address")
    else
       tmr.stop(1)
       print("Wifi connection successful!")
       print("IP Address: "..wifi.sta.getip())
       print("You have 3 seconds to abort...")
       tmr.create().alarm(0, 3000, tmr.ALARM_SINGLE, startup)
    end
end)
