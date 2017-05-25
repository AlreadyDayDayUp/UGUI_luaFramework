

function look(...)
    --if not GameDataConst.WriteLog then return end
    -- 用来记录循环嵌套表的值
    local allTables = {}
    local function internal(tab, str, i, space)
        if allTables[tab] then
            str = str .. space .. tostring(tab) .. ",\n"
            return str
        else
            allTables[tab] = true
        end

        space = space or ""
        for k, v in pairs(tab) do
            if type(v) == "table" then
               str = str .. space .. "[" .. tostring(k) .. "] = \n" .. space .. "{\n" 
               -- 如果递归的层数到达9次，就显示内存地址
               if i <= 9 then 
                    str = internal(v, str, i + 1, space .. "    ")
               else
                    str = str .. tostring(v)
               end
               str = str .. space .. "},\n"
            else
               str = str .. space .."[" .. tostring(k) .. "] = " .. tostring(v) .. ",\n"
            end
        end

        return str
    end
    local str = ""
    local t, a = ...
    if a then
        t = {...}
    end
    if type(t) ~= "table" then   
        str = tostring(t)
    else 
        str = internal(t, str, 1)
    end

    local msg = debug.traceback("", 2)
    str = str .. "\n" .. msg
    log(str)
end
