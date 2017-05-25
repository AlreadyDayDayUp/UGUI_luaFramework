require "Controller/PromptCtrl"
require "Controller/MessageCtrl"

ControllerFactory = {}


CtrlNames = {
	Prompt = "Prompt",
	Message = "Message",
}

local ControllerList = {
	[CtrlNames.Prompt] = PromptCtrl,
	[CtrlNames.Message] = MessageCtrl,
}

function ControllerFactory.CreateCtrl(name)
	local ctrl = ControllerList[name]

	if ctrl then
		return ctrl
	else
		logError("Can't find controller")
	end
end