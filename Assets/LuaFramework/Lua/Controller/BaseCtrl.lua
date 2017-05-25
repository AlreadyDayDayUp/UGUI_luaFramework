require "View/BasePanel"
BaseCtrl = class("BaseCtrl")

function BaseCtrl:ctor(name)
	self.name = name
	self.panel = BasePanel.New(name)
end

function BaseCtrl:OnPanelLoaded(obj)
	self.obj = obj
	self.panel:Awake(obj)
end

function BaseCtrl:Enable(...)
	if isnull(self.obj) then return end
	self.panel:OnEnable()
end

function BaseCtrl:Disable()
	if isnull(self.obj) then return end
	self.panel:OnDisable()
end

function BaseCtrl:Destroy()
	if isnull(self.obj) then return end
	self.panel:OnDestroy()
	destroy(self.obj)
end

function BaseCtrl:AddUIEvent()

end

function BaseCtrl:AddEventListener()

end

function BaseCtrl:RemoveEventListener()

end