BasePanel = class("BasePanel")

function BasePanel:ctor(name)
	self.name = name
end

function BasePanel:Awake(Obj)

end

function BasePanel:OnEnable()
	look("BasePanel.OnEnable")
end

function BasePanel:OnDisable()
	look("BasePanel.OnDisable")
end

function BasePanel:OnDestroy()
	look("BasePanel.OnDestroy")
end