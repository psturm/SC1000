
function create_ap()
    local ssid_ap = "SC LED Ring - ESP_"..node.chipid()    
    print("[Wifi] Creating AP with SSID: "..ssid_ap)
    
    wifi.setmode(wifi.SOFTAP)
    wifi.ap.config({ssid=ssid_ap})
    
    local cfg_ip =
    {
        ip="192.168.23.5",
        netmask="255.255.255.0",
        gateway="192.168.23.1"
    }
    wifi.ap.setip(cfg_ip)
    
    local ip_ap = wifi.ap.getip()
    print("[Wifi] IP: "..ip_ap)

    -- Start HTTP server
    dofile("http_server.lua")
end

create_ap();
