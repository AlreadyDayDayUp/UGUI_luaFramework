require "Common/define"
require "Logic/ControllerFactory"

ControllerManager = {}

local ctrlList = {}

--创建面板--
local function createPanel(name, func)
	PanelManager:CreatePanel(name, func);
end

function ControllerManager.Create(name, ...)
	local ctrl = ctrlList[name]
	if ctrl then 
		return ctrl
	end

	ctrl = assert(ControllerFactory.CreateCtrl(name)).New(name)
	ctrlList[name] = ctrl
	local tempfunc = function(obj)
		ctrl:OnPanelLoaded(obj)
		ctrl:Enable(...)
	end
	createPanel(name, tempfunc)
	return ctrl
end

function ControllerManager.Show(name, ...)
	local ctrl = ctrlList[name]
	if ctrl then 
		ctrl:Enable(...)
	else
		logError("Can't find controller named : " .. name )
	end
end

function ControllerManager.Hide(name)
	local ctrl = ctrlList[name]
	if ctrl then 
		ctrl:Disable()
	else
		logError("Can't find controller named : " .. name )
	end
end

function ControllerManager.Destroy(name)
	local ctrl = ctrlList[name]
	if ctrl then 
		ctrl:Destroy()
	else
		logError("Can't find controller named : " .. name )
	end
end