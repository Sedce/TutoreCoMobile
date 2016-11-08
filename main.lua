-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--IMPORT REQUIREMENTS
local composer = require("composer")
local myApp = require( "myapp" ) 
widget = require("widget")
require("newNavigationBar")
require("newPanel")
local menubut = false

-------------------------------------------------------------------------------
--I DONT KNOW, I JUST COPIED THIS CODE IN THE INTARNIT!
if (display.pixelHeight/display.pixelWidth) > 1.5 then
    myApp.isTall = true
end

if display.contentWidth > 320 then
    myApp.is_iPad = true
end

-- display.setStatusBar( display.HiddenStatusBar )

math.randomseed(os.time())

-----------------------------------------------------------------------------------------
--LOAD IMAGES AND FONTS
local tabBarBackgroundFile = "images/tabbarBack1.png"
local tabBarLeft = "images/tabBar_tabSelectedLeft7.png"
local tabBarMiddle = "images/tabBar_tabSelectedMiddle7.png"
local tabBarRight = "images/tabBar_tabSelectedRight7.png"

myApp.topBarBg = "images/topBarBg7.png"

local iconInfo = {
    width = 40,
    height = 40,
    numFrames = 20,
    sheetContentWidth = 200,
    sheetContentHeight = 160
}

myApp.icons = graphics.newImageSheet("images/ios7icons.png", iconInfo)
myApp.font = "fonts/Roboto-Light.ttf"
myApp.fontBold = "fonts/Roboto-Regular.ttf"
myApp.fontItalic = "fonts/Roboto-LightItalic.ttf"
myApp.fontBoldItalic = "fonts/Roboto-Italic.ttf"

myApp.theme = "widget_theme_ios7"

if system.getInfo("platformName") == "Android" then
    myApp.topBarBg = "images/topBarBg7.png"

else
    local coronaBuild = system.getInfo("build")
    if tonumber(coronaBuild:sub(6,12)) < 1206 then
        myApp.theme = "widget_theme_ios"
    end

end
widget.setTheme(myApp.theme)

-----------------------------------------------------------------------------------------
------------------------------------------TAB BAR----------------------------------------
--Create an array for tabbars
myApp.tabBar = {}
-----------------------------------------------------------------------------------------
--EVENTS FOR TAB BAR BUTTONS
function myApp.showScreen1()
    myApp.tabBar:setSelected(1)
    composer.removeHidden()
    composer.gotoScene("findTutor", {time=250, effect="crossFade"})
    return true
end

function myApp.showScreen2(event)
    myApp.tabBar:setSelected(2)
    composer.removeHidden()
    composer.gotoScene("findTutee", {time=250, effect="crossFade"})
    return true
end

function myApp.showScreen3()
    myApp.tabBar:setSelected(3)
    local options = {
        pageTitle = "View Tutor"
    }
    composer.removeHidden()
    composer.gotoScene("viewTutor", {time=250, effect="crossFade", params = options})
    return true
end
-------------------------------------------------------------------------------------------
--EVENTS FOR BUTTONS IN NAVIGATION BAR

function handleLogoButton(event)
   if ( event.phase == "ended" ) then
      print( "Button Logo Clicked" )
        -- panel:show()
        -- panel:toFront()
   end
   return true
end

--SHOW TAB BUTTONS
local tabButtons = {
    {
        label = "Look for Tutor",
        defaultFile = "images/iconTutor.png",
        overFile = "images/iconTutore.png",
        labelColor = { 
            default = { 255/255, 255/255, 255/255 }, 
            over = {  0.698039, 0.133333, 0.133333  }
        },
        width = 32,
        height = 29,
        onPress = myApp.showScreen1,
        selected = true,
    },
    {
        label = "Look for Tutee",
        defaultFile = "images/iconTutee.png",
        overFile = "images/iconTuteer.png",
        labelColor = { 
            default = { 255/255, 255/255, 255/255 }, 
            over = { 0.698039, 0.133333, 0.133333 }
        },
        width = 32,
        height = 29,
        onPress = myApp.showScreen2,
    },
    {
        label = "View Tutors",
        defaultFile = "images/menu.png",
        overFile = "images/iconTutor.png",
        labelColor = { 
            default = { 255/255, 255/255, 255/255 }, 
            over = { 0.698039, 0.133333, 0.133333}
        },
        width = 32,
        height = 28,
        onPress = myApp.showScreen3,
    },
}

--CREATE TAB BAR
myApp.tabBar = widget.newTabBar{
    top =  display.contentHeight - 50,
    left = 0,
    width = display.contentWidth,
    
    tabSelectedLeftFile = tabBarLeft,      -- New
    tabSelectedRightFile = tabBarRight,    -- New
    tabSelectedMiddleFile = tabBarMiddle,      -- New
    tabSelectedFrameWidth = 20,                                         -- New
    tabSelectedFrameHeight = 50,                                        -- New    
    buttons = tabButtons,
    height = 50,
    backgroundFile="images/tabbarBack1.png"
}
---------------------------------------------------------------------------------------------
------------------------------------------SLIDE PANEL----------------------------------------

panel1 = widget.newPanel
{
    location = "left",
    onComplete = panelTransDone,
    width = display.contentWidth,
    height =display.contentHeight ,
    speed = 500,
    inEasing = easing.outBack,
    outEasing = easing.outCubic,
}
function profileButtonEvent(event)
   if ( event.phase == "ended" ) then
      print( "Button Logo Clicked" )
        composer.gotoScene("profile", {time=250, effect="crossFade"})
         panel1:hide()
        -- panel:toFront()
   end
   return true
end
panel1.background = display.newRect( -47,-110,panel1.width*0.50, (panel1.height/1.255)/2 )
panel1.background:setFillColor( 0,0,0,.7)
panel1:insert( panel1.background )

panel1.item1 = widget.newButton(
    {
        label = "Profile",
        onEvent = profileButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "Rect",
        width = panel1.background.width,
        height = panel1.background.height/4,
        cornerRadius = 2,
        fillColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        strokeColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        strokeWidth = 4,
        x = -47,
        y = -193
    }
)
panel1:insert( panel1.item1 )
function settingsButtonEvent(event)
   if ( event.phase == "ended" ) then
      print( "Button Logo Clicked" )
        composer.gotoScene("findTutor", {time=250, effect="crossFade"})
        -- panel:show()
        -- panel:toFront()
   end
   return true
end
panel1.item2 = widget.newButton(
    {
        label = "Settings",
        onEvent = settingsButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "Rect",
        width = panel1.background.width,
        height = panel1.background.height/4,
        cornerRadius = 2,
        fillColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        strokeColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        x = -47,
        y = -133,
        strokeWidth = 4
    }
)
panel1:insert( panel1.item2 )
function aboutButtonEvent(event)
   if ( event.phase == "ended" ) then
      print( "Button Logo Clicked" )
        composer.gotoScene("profile", {time=250, effect="crossFade"})
        -- panel:show()
        -- panel:toFront()
   end
   return true
end
panel1.item3 = widget.newButton(
    {
        label = "About",
        onEvent = aboutButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "Rect",
        width = panel1.background.width,
        height = panel1.background.height/4,
        cornerRadius = 2,
        fillColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        strokeColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        x = -47,
        y = -80,

        strokeWidth = 4
    }
)
panel1:insert( panel1.item3 )
function logoutButtonEvent(event)
   if ( event.phase == "ended" ) then
      print( "Button Logo Clicked" )
        composer.gotoScene("findTutor", {time=250, effect="crossFade"})
        -- panel:show()
        -- panel:toFront()
   end
   return true
end
panel1.item4 = widget.newButton(
    {
        label = "Log-out",
        onEvent = logoutButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "Rect",
        width = panel1.background.width,
        height = panel1.background.height/4,
        cornerRadius = 2,
        fillColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        strokeColor = { default={1,1,1,.7}, over={0,0,0, .7} },
        x = -47,
        y = -30,
        strokeWidth = 4
    }
)
panel1:insert( panel1.item4 )




---------------------------------------------------------------------------------------------
------------------------------------------NAVIGATION BAR-------------------------------------
function handleMenuButton(event)
   if ( event.phase == "ended" ) then
      print( "Button 1" )
      if(menubut == false) then
        panel1:show()
        panel1:toFront()
        menubut = true
        else
            menubut = false
            panel1:hide()
        end

        --Removes the scenes
   end
   return true
end
local navBar = widget.newNavigationBar({
   background =  "images/tabbarBack1.png",
   titleColor = {255/255, 215/255, 0},
   menuButton = {
      onEvent = handleMenuButton,
      width = 35,
      height = 30,
      defaultFile = "images/hamburger.png",
      overFile = "images/showbutton_over1.png",
    },
    logoButton = {
      onEvent = handleLogoButton,
      width = 150,
      height = 40,
      defaultFile = "tutorecoicon_horizontal.png",
    },
   includeStatusBar = true
})
---------------------------------------------------------------------------------------------
-----------------------------------SCREEN INTRODUCTION---------------------------------------
local logo = display.newImageRect("images/logoT.png", 320, 568)
logo.x = display.contentCenterX
logo.y = display.contentCenterY



local function closeSplash()
    display.remove(logo)
    logo = nil
    display.remove(background)
    background = nil
    myApp.showScreen1()
end

timer.performWithDelay(1500, closeSplash)
-- composer.gotoScene("panel", {effect="fade",time=500})