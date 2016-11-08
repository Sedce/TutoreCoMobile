local composer = require("composer")
local widget = require("widget")
local myApp = require( "myapp" )
local json = require( "json" )  -- Include the Corona JSON library
local scene = composer.newScene()

function scene:create(event)
	local sceneGroup = self.view
local bg = display.newRect( 0,0, display.contentWidth, display.contentHeight)
	bg:setFillColor(1,1,1)
    bg.x = display.contentWidth / 2
    bg.y = display.contentHeight / 2
	sceneGroup:insert(bg)

	local imgIcon = widget.newButton{
			x = display.contentWidth/2,
			y = 60,
			-- defaultFile = "imageicn.png",
			-- overFile = "imageicn.png",
			onEvent = imgIconEvent,
			width = 100,
			height = 100,
	}
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase

	if(phase == "will") then

	elseif(phase == "did") then

	end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase

	if(phase == "will") then

	elseif(phase == "did") then

	end
end

function scene:destroy(event)
	local sceneGroup = self.view
end

--------------------------------------------------------------------------------------------------------
scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)
return scene