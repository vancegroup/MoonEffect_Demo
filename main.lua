require("Actions")
require("getScriptFilename")
vrjLua.appendToModelSearchPath(getScriptFilename())
runfile([[Grid_Floor.lua]])

Grid.create()

-- vrjKernel.loadConfigFile("s:/jconf30/mixins/METaL.wiimotewandbuttons.jconf")
-- vrjKernel.loadConfigFile("s:/jconf30/mixins/METaL.treetarget.aswand.jconf")

device = gadget.PositionInterface("VJWand")

sw1 = osg.Switch()
sw2 = osg.Switch()
sw3 = osg.Switch()
sw4 = osg.Switch()
-- tronSwitch = osg.Switch()
s1 = Transform{position = {2,1.5,.75},Sphere{radius = .3}}
s2 = Transform{position = {2,1.5,0},Sphere{radius = .3}}
s3 = Transform{position = {2,1.5,-.75},Sphere{radius = .3}}
s4 = Transform{position = {2,1.5,-40},Sphere{radius = .3}}
sw1:addChild(s1)
sw2:addChild(s2)
sw3:addChild(s3)
sw4:addChild(s4)
-- tronSwitch:addChild(tronfloor)

sw1:setAllChildrenOn()
sw2:setAllChildrenOn() 	
sw3:setAllChildrenOn() 	
sw4:setAllChildrenOn()
Grid.show() 	 	
-- tronSwitch:setAllChildrenOn()

		
RelativeTo.World:addChild(sw1)
RelativeTo.World:addChild(sw2)
RelativeTo.World:addChild(sw3)
RelativeTo.World:addChild(sw4)

Actions.addFrameAction(function()
	local drawBtn = gadget.DigitalInterface("VJButton1")
	local index = 0
	while true do
		while not drawBtn.justPressed do
			Actions.waitForRedraw()
		end
		
		--set object position based on index
		if index == 0 then
			sw1:setAllChildrenOn()
			sw2:setAllChildrenOff() 	
			sw3:setAllChildrenOff() 	
			sw4:setAllChildrenOff()
			Grid.hide()
			Actions.waitForRedraw()
			-- tronSwitch:setAllChildrenOff()
		elseif index == 1 then
			sw1:setAllChildrenOff()
			sw2:setAllChildrenOn() 	
			sw3:setAllChildrenOff() 	
			-- tronSwitch:setAllChildrenOff()
			sw4:setAllChildrenOff()
			Actions.waitForRedraw()
		elseif index == 2 then
			sw1:setAllChildrenOff()
			sw2:setAllChildrenOff() 	
			sw3:setAllChildrenOn() 	
			sw4:setAllChildrenOff()
			-- tronSwitch:setAllChildrenOff()
			Actions.waitForRedraw()
		elseif index == 3 then
			sw1:setAllChildrenOff()
			sw2:setAllChildrenOff() 	
			sw3:setAllChildrenOff() 	
			sw4:setAllChildrenOn()
			-- tronSwitch:setAllChildrenOff()
			Actions.waitForRedraw()
		elseif index == 4 then
			sw1:setAllChildrenOn()
			sw2:setAllChildrenOn() 	
			sw3:setAllChildrenOn() 	
			sw4:setAllChildrenOn()
			Grid.show()
			Actions.waitForRedraw()
		end
	
		index = index + 1
		if index > 4 then
			index = 0
		end
		
	end
end)