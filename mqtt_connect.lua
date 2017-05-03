m = mqtt.Client(devicename, 120)

m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(client) print ("connected mqtt") end)
m:on("offline", function(client) print ("offline mqtt") end)

m:on("message", function(client, topic, data)
  print(topic .. ":") 
  if data ~= nil then
    print(data)
  end
end)

function updateTemp()
    status, temp, humidity, temp_dec, humid_dec = dht.read(4)
    temp = (temp * 1.8) + 32
end

function post_temp()
    updateTemp()
    m:publish(topic..devicename.."/temp", temp, 0, 1)
    m:publish(topic..devicename.."/humidity", humidity, 0, 1)
    print("Wrote temp: "..temp.." and humidity: "..humidity)
end

m:connect(server, port, 0, function(client) print("connected to mqtt") end,
                                     function(client, reason) print("failed reason: "..reason) end)

tmr.alarm(0, xmitperiod, tmr.ALARM_AUTO, post_temp)
