--[[
Auth:Chiuan
like Unity Brocast Event System in lua.
]]

local Event = {}
local events = {}
local logError = logError

function Event.AddListener(key, func, Obj)
	if not key or type(key) ~= "string" then
		logError("event parameter in addlistener function has to be string, " .. type(key) .. " not right.")
		return
	end
	if not func or type(func) ~= "function" then
		logError("func parameter in addlistener function has to be function, " .. type(func) .. " not right")
		return
	end

	if not events[key] then
		--create the Event with name
		events[key] = event(tostring(key))
	end

	--add this func
	events[key]:Add(func, Obj)
end

function Event.Brocast(key, ...)
	if not events[key] then
		logError("brocast " .. key .. " has no event.")
		return
	end
	local args = {...}
	local co = coroutine.create(function(args)
		events[key](unpack(args))
	end)

	local flag, msg = coroutine.resume(co, args)
	if not flag then logError(msg) end
end

function Event.RemoveListener(key,func, Obj)
	if not events[key] then
		logError("remove " .. key .. " has no event.")
		return
	end

	events[key]:Remove(func, Obj)
end

function Event.ClearAllListener(key)
	events[key] = nil
end 

function Event.Dump()
	look(events)
end

---Test

function test()
	local key1, key2, key3, key4  = "1001", "1002", "1003", "1004"
	local func = function(str)
		print(str, str)
	end

	local function add(key)
		Event.AddListener(key, func)
	end

	local function fire(key)
		Event.Brocast(key, key)
	end

	local function remove(key)
		Event.RemoveListener(key, func)
	end

	local function clear(key)
		Event.ClearAllListener(key)
	end

	add(key1)
	add(key1)
	add(key2)
	add(key4)
	Event.Dump()
	fire(key1)
	fire(key4)

	remove(key1)
	Event.Dump()

	remove(key3)
	Event.Dump()

	clear(key1)
	Event.Dump()
end

test()
return Event