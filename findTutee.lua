local composer = require("composer")
local widget = require("widget")
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

-- local function textListener( event )

-- 	    if ( event.phase == "began" ) then
-- 	        -- User begins editing "defaultBox"

-- 	    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
-- 	        -- Output resulting text from "defaultBox"
-- 	        -- print( event.target.text )

-- 	    elseif ( event.phase == "editing" ) then
-- 	        -- print( event.newCharacters )
-- 	        -- print( event.oldText )
-- 	        -- print( event.startPosition )
-- 	        print( event.text )
-- 	    end
-- end



-- local function submitForm( event )
-- 	local function networkListener( event )
-- 		if ( event.isError ) then
-- 	        print( "Network error!")
-- 	    else

-- 	    end
-- 	end
	    
--     local headers = {
-- 	    ["Content-Type"] = "application/json",
-- 	    ["Accept-Language"] = "en-US",
-- 	}
-- 	local tutor = {
-- 	      stud_id=6,
-- 	      isTutor=false,
-- 	      subj_id=40,
-- 	      post_title="Bio 1",
-- 	      desc = textField.text
-- 	}

-- 	local params = {}
-- 	params.headers = headers
-- 	params.body = json.encode( tutor )

-- 	print( "params.body: "..params.body )

-- 	-- POST
-- 	network.request( "http://172.16.14.55:4000/add_mobilepost", "POST", networkListener,params)
-- end



function scene:create(event)
	local sceneGroup = self.view

	--BACKGROUND
	local containerBG = display.newContainer( display.contentWidth, display.contentHeight  )
	containerBG:translate(160,284)

	-- local gradient = { type="gradient", color1={193/255, 255/255, 193/255}, color2={193/255, 255/255, 193/255}, direction="down" } 

	local bg = display.newRect( 0,0, display.contentWidth, display.contentHeight)
	bg:setFillColor(1,1,1)
	-- bg.x = display.contentCenterX
	-- bg.y = display.contentCenterY
	

	-- Create the widget
	local scrollView = widget.newScrollView
	{
	    x = 0,
	   	y = 0 + 55,
	    height = 450,
	    scrollWidth = 36,
	    scrollHeight = 500,
	  backgroundColor = {1,1,1},
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
	-- containerBG.anchorX, containerBG.anchorY = 0, 0
	-- -- containerBG.width, containerBG.height = 200,500
	-- containerBG.x, containerBG.y = 0, 0

	-- scrollView.anchorX, scrollView.anchorY = 0,0
	-- scrollView:setScrollWidth(200)
	-- scrollView:setScrollHeight(500)
	-- scrollView.x, scrollView.y = -160,-150
-----------------------------------------------------------------------------------------
	-- DisplayTextSample
	-- local function networkListener( event )

	    
	--     if ( event.isError ) then
	--         print( "Network error!")
	--     else
	--         -- print ( "RESPONSE: " .. event.response )
	--         serializedString = json.decode( event.response )
			-- print(serializedString[1].row_to_json.student_id)

    		-- sString = serializedString[1].row_to_json.student_id
    		-- lString = serializedString[1].row_to_json.title
		    

		 --    for i = 1, 3 do
		 --    	print("heuhue")
				-- local id = serializedString[1].row_to_json.student_id
				-- -- local isTutor = serializedString[1].row_to_json.istutor
				-- local subjectID = serializedString[1].row_to_json.subject_id
				-- local titlePost = serializedString[1].row_to_json.title
				-- local description = serializedString[1].row_to_json.description

			 --  	id = 
				-- {
			 --        text = id,
				--     x = 150,
				--     y = 20,
				--     width = 250,
				--     font = native.systemFontBold,   
				--     fontSize = 18,
				--     align = "justify"  -- alignment parameter
				-- }


				-- subjectID = 
				-- {
			 --        text = subjectID,
				--     x = 150,
				--     y = 80,
				--     width = 250,
				--     font = native.systemFontBold,   
				--     fontSize = 18,
				--     align = "justify"  -- alignment parameter
				-- }

				-- titlePost = 
				-- {
			 --        text = titlePost,
				--     x = 150,
				--     y = 110,
				--     width = 250,
				--     font = native.systemFontBold,   
				--     fontSize = 18,
				--     align = "justify"  -- alignment parameter
				-- }

				-- description = 
				-- {
			 --        text = description,
				--     x = 150,
				--     y = 150,
				--     width = 250,
				--     font = native.systemFontBold,   
				--     fontSize = 18,
				--     align = "justify"  -- alignment parameter
				-- }

				-- myText = display.newText( id )
				-- myText:setFillColor( 1, 0, 0 )
				-- scrollView:insert(myText)

				-- myText = display.newText( subjectID )
				-- myText:setFillColor( 1, 0, 0 )
				-- scrollView:insert(myText)

				-- myText = display.newText( titlePost )
				-- myText:setFillColor( 1, 0, 0 )
				-- scrollView:insert(myText)

				-- myText = display.newText( description )
				-- myText:setFillColor( 1, 0, 0 )
				-- scrollView:insert(myText)
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
        text = "Title: I am good at Chemistry", --serializedString[1].row_to_json.student_upmail,
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
        text = "\nI am good at chemistry. I can help you. I am free during the weekends. For more information please check my schedule ", --serializedString[1].row_to_json.student_upmail,
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
	name:setFillColor( 30/255, 124/255, 144/255)
	scrollView:insert(name)

	local title = display.newText( Title )
	title:setFillColor(64/255,61/255,71/255,1)
	scrollView:insert(title)
--     end
-- end
-- 	end

-- 	network.request( "http://172.16.14.55:4000/mobileviewposttutee", "GET", networkListener, params)

	-- local options = 
	-- {
	--     --parent = textGroup,
	--     text = "Name: Bilflil Zufckerbergenji\nPhone No: 09323576867\n\nTitle: I am good in math and I am good looking... See More",     
	--     x = 150,
	--     y = 100,
	--     width = 250,
	--     font = native.systemFontBold,   
	--     fontSize = 15,
	--     align = "justify"  -- alignment parameter
	-- }
--------------------------------------------------------------------------------------------------------PLACEHOLDER
	-- textField = native.newTextBox(display.contentWidth/100,-120,290,70)
	-- textField.inputType = "text"
	-- textField.isEditable = true
	-- textField.size = 15
	-- textField.placeholder = "\n                          (Add Post)"
	-- textField:addEventListener("userInput",textListener)
	-- containerBG:insert(textField)

	-- submitButton = widget.newButton({
 --        width = 160,
 --        height = 40,
 --        label = "Submit",
 --        labelColor = { 
 --            default = { 0,0,0 }, 
 --            over = { 0.79, 0.48, 0.30 } 
 --        },
 --        labelYOffset = -4, 
 --        font = myApp.font,
 --        fontSize = 18,
 --        emboss = false,
 --        onRelease = submitForm
 --    })

 --    submitButton.x = 0
 --    submitButton.y = -60
 --    containerBG:insert(submitButton)
    -- sceneGroup:insert( submitButton )
--------------------------------------------------------------------------------------------------------
	-- --TEXT FOR DROPDOWN
	local function submitPostEvent( event)
		if("ended" == event.phase) then
			print ("Button was pressed and released")
			panel:hide()
			postContent.isVisible = false
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
	-- --DROPDOWN SAMPLE ONLY
	-- local myDropdown

	-- local dropdownOptions = {
	--   {
	--     title     = 'Go to Home',
	--     action    = function() 
	--       native.showAlert('Dropdown', 'Dropdown', {'Ok'})
	--     end 
	--   },
	--   {
	--     rightIcon = display.newImageRect('rightIcon.png', 32, 32),
	--     title     = 'Test',
	--     action    = function() 
	--       native.showAlert('Dropdown', 'Dropdown', {'Ok'})
	--     end 
	--   },
	--   {
	--     leftIcon  = display.newImageRect('star.png', 32, 32),
	--     rightIcon = display.newImageRect('rightIcon.png', 32, 32),
	--     title     = 'My favorite component',
	--     action    = function() 
	--       native.showAlert('Dropdown', 'Dropdown', {'Ok'})
	--     end 
	--   },
	-- }
	local function handleButtonEvent( event)
		if("ended" == event.phase) then
			print ("Button was pressed and released")
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
            y = display.contentCenterY - 188
       		
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
	-- local button = widget.newButton{
	--   width       = 290,
	--   height      = 40,
	--   defaultFile = 'images/dropdown.png',
	--   overFile    = 'images/dropdown.png',
	--   onEvent     = function( event )
	--     local target = event.target
	--     local phase  = event.phase
	--     if phase == 'began' then
	--       target.alpha = .5
	--     else
	--       target.alpha = 1
	--       if phase ==  'ended' then
	--         myDropdown:toFront()
	--         myDropdown:toggle()
	--       end
	--     end
	--   end
	-- }
	-- button.alpha = .5

	-- myDropdown     = dropdown.new{
	--   x            = screen.rightSide - 20,
	--   y            = screen.topSide + 100,
	--   toggleButton = button,
	--   width        = 280,
	--   marginTop    = 12,
	--   padding      = 20,
	--   options      = dropdownOptions
	-- }
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