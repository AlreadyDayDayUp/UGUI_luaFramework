require "View/BasePanel"
BaseCtrl = class("BaseCtrl")

function BaseCtrl:ctor(name)
	self.name = name
	self.panel = BasePanel.New(name)
end

function BaseCtrl:OnPanelLoaded(obj)
	self.obj = obj
	self.panel:Awake(obj)
	self:AddUIEvent()
end

function BaseCtrl:Enable(...)
	if isnull(self.obj) then return end
	self:AddEventListener()
	self.obj:SetActive(true)
	self.panel:OnEnable()
end

function BaseCtrl:Disable()
	if isnull(self.obj) then return end
	self:RemoveEventListener()
	self.panel:OnDisable()
	self.obj:SetActive(false)
end

function BaseCtrl:Destroy()
	if isnull(self.obj) then return end
	self.panel:OnDestroy()
	destroy(self.obj)
end

function BaseCtrl:AddUIEvent()
	look("BaseCtrl.AddUIEvent")
end

function BaseCtrl:AddEventListener()
	look("BaseCtrl.AddUIEvent")
end

function BaseCtrl:RemoveEventListener()
	look("BaseCtrl.AddUIEvent")
end