

function _connect_ap(ssid, pwd, ip_cfg)
    print("[WIFI] Connecting SSID="..ssid.." ..")
    
    wifi.setmode(wifi.STATION)
    wifi.sta.config(ssid, pwd)
    wifi.sta.setip(ip_cfg)
    wifi.sta.connect()

    local time = tmr.now()
    local timeout = 30000000
    tmr.alarm(1, 1000, 1, function()
        local status = wifi.sta.status()
        if status == 5 then
            tmr.stop(1)
            ip, nm, gw = wifi.sta.getip()
            if ip == nil then
                print("[WIFI] Failed: No IP!")
            else
                print('IP=' .. ip)
                wifi_post_init()
            end
        else
            if tmr.now() - time > timeout then
                tmr.stop(1)
                print("Timeout. Stat="..status)
          end
        end
    end)
end

function connect_ap()
    if (wifi.sta.status() == 5) then
        print("[WIFI] Already connected.")
        ip, nm, gw = wifi.sta.getip()
        print('IP: ' .. ip)
        dofile("http_server.lua")
    else
        _connect_ap("TellMyWifiLoveHer", "**********");
        dofile("http_server.lua")
    end
end


function create_ap()
    local ssid_ap = "ESP_"..node.chipid()
    local cfg_ap = {ssid=ssid_ap}
    print("Creating AP with SSID="..cfg_ap.ssid)
    
    wifi.setmode(wifi.SOFTAP)
    wifi.ap.config(cfg_ap)
    
    local cfg_ip =
    {
        ip="192.168.23.5",
        netmask="255.255.255.0",
        gateway="192.168.23.1"
    }
    wifi.ap.setip(cfg_ip)
    
    local ip_ap = wifi.ap.getip()
    print("Listening on "..ip_ap)
    dofile("http_server.lua")
end

create_ap();
-- connect_ap();