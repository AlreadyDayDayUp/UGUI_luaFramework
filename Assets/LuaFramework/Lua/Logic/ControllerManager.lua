require "Common/define"
require "Logic/ControllerFactory"

ControllerManager = {}

local ctrlList = {}

--创建面板--
local function createPanel(name, func)
	PanelManager:CreatePanel(name, func);
end

local function closePanel(name)
	PanelManager:ClosePanel(name)
end

function ControllerManager.Show(name, ...)
	local ctrl = assert(ControllerFactory.CreateCtrl(name))
	local tempfunc = nil
	if ctrl.init  and type(ctrl.init) == "function" then
		tempfunc = function()
			ctrl.init(...)
		end
	else
		logWarn(name .. "Ctrl has no Init Function, or it is not a function")
	end
	createPanel(name, tempfunc)
end

function ControllerManager.Close(name)
	closePanel(name)
end