local composer = require("composer")
local widget = require("widget")
require("newPanel")
local myApp = require( "myapp" )
local json = require( "json" )  -- Include the Corona JSON library
local dropdown = require('dropdown')
local screen = require('screen')
local scene = composer.newScene()
local bg
local title
local add
local textField
local postContent
local c

function scene:create(event)
	local sceneGroup = self.view

	--BACKGROUND
	local containerBG = display.newContainer( display.contentWidth, display.contentHeight)
	containerBG:translate(160,284)

	-- local gradient = { type="gradient", color1={193/255, 255/255, 193/255}, color2={193/255, 255/255, 193/255}, direction="down" } 

	local bg = display.newRect( 0,0, display.contentWidth, display.contentHeight)
	bg:setFillColor(236/255,238/255,240/255 )
	print(display.contentHeight)
	-- bg.x = display.contentCenterX
	-- bg.y = display.contentCenterY
	-- Create the widget 
	local scrollView = widget.newScrollView
	{
	    x = 0,
	   	y = 0 + 55,
	    height = 450,
	    scrollWidth = 360,
	    scrollHeight = 500,
	   backgroundColor = {236/255,238/255,240/255 },
	    -- listener = scrollListener
	}
	local imgIcon = widget.newButton{
			x = display.contentWidth/2,
			y = 50,
			defaultFile = "imageicn.png",
			overFile = "imageicn.png",
			onEvent = imgIconEvent,
			width = 100,
			height = 100,
}

	scrollView:insert(imgIcon)
	containerBG:insert(bg)
	containerBG:insert(scrollView)
	-- sceneGroup:insert(scrollView)

	-- Layout
	
-----------------------------------------------------------------------------------------
	-- DisplayTextSample

	-- local function networkListener( event )

	    
	--     if ( event.isError ) then
	--         print( "Network error!")
	--     else
	--          print ( "RESPONSE: " .. event.response )
	-- serializedString = json.decode( event.response )	    
local name = 
	{
       text = "Cedez Gulane", --serializedString[1].row_to_json.student_upmail,
	   x = display.contentWidth/2,
	   y = 110,
	   width = 250,
	   height = 0,
	   font = native.systemFontBold,   
	   fontSize = 24,
	   align = "center"  -- alignment parameter
	} 
	local Title = 
	{
        text = "Title: I am not good at Chemistry", --serializedString[1].row_to_json.student_upmail,
	   x = display.contentWidth/2,
	   y = name.height + name.y + 40,
	    width = 250,
	    height = 0,
	    font = native.systemFontBold,   
	    fontSize = 18,
	    align = "left"  -- alignment parameter
	}
	local Post = 
	{
        text = "\nI am not good at chemistry. Please help me. I am free during the weekends. For more information please check my schedule ", --serializedString[1].row_to_json.student_upmail,
	    x = display.contentWidth/2,
		y = Title.height + Title.y + 80,
	    width = 250,
	    height = 0,
	    font = native.systemFontBold,   
	    fontSize = 18,
	    align = "left"  -- alignment parameter
	}  
	local details = 
	{
        text = "B.S. Computer Science \n3rd Year \n09390038095 \n", --serializedString[1].row_to_json.student_upmail,
	    x = 160,
	   	y = Post.height + Post.y + 125,
	    width = 250,
	    height = 0,
	    font = native.systemFontBold,   
	    fontSize = 15,
	    align = "justify"  -- alignment parameter
}


	local detail = display.newText( details )
	detail:setFillColor(64/255,61/255,71/255,1)
	scrollView:insert(detail)

	local post = display.newText( Post )
	post:setFillColor(64/255,61/255,71/255,1)
	scrollView:insert(post)

	local name = display.newText( name )
	name:setFillColor( 157/255,208/255,138/255,1)
	scrollView:insert(name)

	local title = display.newText( Title )
	title:setFillColor(64/255,61/255,71/255,1)
	scrollView:insert(title)
--     end
-- end
--  network.request( "http://172.16.14.55:4000/mobileviewposttutee", "GET", networkListener, params)


	local function handleButtonEvent( event)
		if("ended" == event.phase) then
			panel:show()
        	panel:toFront()
        	postContent = native.newTextBox(161,310,317.5,300) --kay gahi man ug ulo ang textbox
			postContent.placeholder = "Enter post here. \nPlease review your post before\n submitting it" --inig click na lang sa user sa write post 
			postContent.isEditable = true -- maghimo ug textbox. pabebe ang textbox, wag gayahin
			postContent.font = native.newFont("Helvetica-Bold", 18)
			postContent.hasBackground = false
    		
		end
	end

	local writePost = widget.newButton{
			label = "Write a Post",
			 labelColor = { 
            default = {64/255,61/255,71/255,1}, 
            over = { 0.698039, 0.133333, 0.133333},
            x = display.contentCenterX - 80,
            y = display.contentCenterY - 188,
        },
        	shape = "Rect",
        	width = display.contentWidth/2,
        	height = 47,
			onEvent = handleButtonEvent,
			emboss = false,
			fillColor = { default={236/255,238/255,240/255 }, over={1,1,1} },
        	strokeColor = { default={236/255,238/255,240/255 }, over={1,1,1} },
        	strokeWidth = 4,
			x = display.contentCenterX - 80,
			y = display.contentCenterY - 188
}



	local function handleButtonEvent( event)
		if("ended" == event.phase) then
			print ("Button was pressed and released")
		end
	end

	local FilterPosts = widget.newButton{
			label = "Filter Posts",
			 labelColor = { 
            default = { 64/255,61/255,71/255,1}, 
            over = { 0.698039, 0.133333, 0.133333},
            x = display.contentCenterX - 80,
            y = display.contentCenterY - 188
       		
        },
        	shape = "Rect",
        	width = display.contentWidth/2,
        	height = 47,
			onEvent = handleButtonEvent,
			emboss = false,
			fillColor = { default={236/255,238/255,240/255}, over={1,1,1} },
        	strokeColor = { default={236/255,238/255,240/255}, over={1,1,1} },
        	strokeWidth = 4,
			x = display.contentCenterX - 80,
			y = display.contentCenterY - 188
}

FilterPosts.x = display.contentCenterX + 80
FilterPosts.y = display.contentCenterY - 188
FilterPosts.setLabel = ("Filter Posts")
----------------------------------------------------------------------------------------------------
--panel for write a post

local function submitPostEvent( event)
		if("ended" == event.phase) then
			print ("Button was pressed and released")
			panel:hide()
			postContent.isVisible = false
			local function submitForm( event )
	local function networkListener( event )
		if ( event.isError ) then
	        print( "Network error!")
	    else

	    end
	end
	    
    local headers = {
	    ["Content-Type"] = "application/json",
	    ["Accept-Language"] = "en-US",
	}
	local tutor = {
	      stud_id=6,
	      isTutor=true,
	      subj_id=40,
	      post_title= panel.item2,
	      desc = postContent.text
	}

	local params = {}
	params.headers = headers
	params.body = json.encode( tutor )

	print( "params.body: "..params.body )

	-- POST
	network.request( "http://172.16.14.55:4000/add_mobilepost", "POST", networkListener,params)
end
		end
	end

local function cancelSubmitEvent( event)
		if("ended" == event.phase) then
			print ("Button was pressed and released")
			panel:hide()
			postContent.isVisible = false

		end
	end
panel = widget.newPanel
{
    location = "left",
    onComplete = panelTransDone,
    width = display.contentWidth,
    height = display.contentHeight,
    speed = 500,
    inEasing = easing.outBack,
    outEasing = easing.outCubic
}
panel.background = display.newRect( 0, 12, 360,449 )
panel.background:setFillColor( 157/255,208/255,138/255,.8 )
panel:insert( panel.background )
panel.item1= display.newRect(0,-187.5,360,50)
panel.item1:setFillColor(157/255,208/255,138/255,.8)
panel.title = display.newText( "Write a Post", -55, -187.5, native.systemFont, 30 )
panel.title:setFillColor( 1,1,1,1 )
panel.item2 = native.newTextField(1,-142.5,317.5,40)
panel.item2.placeholder = "Enter title here"
panel.item3 =  widget.newButton{
		--	onEvent = submitPostEvent,
			--label = "Submit",
			defaultFile = "checkB.png",
			overFile = "Submit.png",
			onEvent = submitPostEvent,
			width =30,
			height = 30
}
panel.item3.x =  30
panel.item3.y =  210
panel.item4 =  widget.newButton{
		--	onEvent = submitPostEvent,
			--label = "Submit",
			defaultFile = "cancelB.png",
			overFile = "cancelB.png",
			onEvent = cancelSubmitEvent,
			width =30,
			height = 30
}
panel.item4.x =  100
panel.item4.y =  210
panel:insert(panel.item2)
panel:insert(panel.item1)
panel:insert(panel.title)
panel:insert(panel.item3)
panel:insert(panel.item4)

---------------------------------------------------------------------------------------------------------------
	--SCENE Insert
	sceneGroup:insert(containerBG)

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