
function render_json()
    local buf = "Content-Type: application/json\n\n{"
    buf = buf.."\"ledCount\": "..LED_COUNT..",".."\"pattern\": ["
    for i = 1, #PATTERN do
        buf = buf.."{\"a\": "..PATTERN[i].angle_offset..", \"r\": "..PATTERN[i].r..", \"g\": "..PATTERN[i].g..", \"b\": "..PATTERN[i].b.."}"
        if i < #PATTERN then buf = buf.."," end
    end
    buf = buf.."]}"
    return buf;
end

function _parse_get_params(_vars)
    local _params = {}
    if (_vars ~= nil) then
        for k, v in string.gmatch(_vars, "([^=&]+)=([^=&]+)&*") do
            _params[k] = v
        end
    end
    return _params
end


if srv == nil then 
    print("[HTTP Server] Starting ..")
    srv = net.createServer(net.TCP) 
end

srv:listen(80,function(conn)
    conn:on("receive", function(client, request)
        local buf = "";
        buf = buf.."HTTP/1.1 200 OK\n"
        buf = buf.."Access-Control-Allow-Origin: *"

        print(request)
        
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if (method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end

        if method == "POST" then
            _, _, post_data = string.find(request, "\r\n\r\n(.+)");
            post_data_parsed = _parse_get_params(post_data)
            
            if post_data_parsed.pattern then
                local _pattern = {}
                if file.open("pattern.lua", "w+") then
                    file.writeline("PATTERN = {")
                    for pattern_step in string.gmatch(post_data_parsed.pattern, "[^;]+") do
                        local _, _, _angle, _r, _g, _b = string.find(pattern_step, "(%d+),(%d+),(%d+),(%d+)")
                        
                        local step = {angle_offset=_angle, r=tonumber(_r), g=tonumber(_g), b=tonumber(_b)}
                        table.insert(_pattern, step)
                        file.writeline("{angle_offset=".._angle..", r=".._r..", g=".._g..", b=".._b.."},")
                    end
                    file.writeline("}")
                    file.close()
                end
                print("Updated pattern config file.")
                PATTERN = _pattern
            end
        end

        
        if (path == "/favicon.ico") then 
            -- do nothing
        else        
            buf = buf.."\n"..render_json();
        end
        
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)