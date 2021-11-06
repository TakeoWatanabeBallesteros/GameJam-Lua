--Takeo Watanabe
--#region ALL_CLASES
Vector = Vector or require "Engine/vector"
Object = Object or require "Engine/object"
Yarnparse = Yarnparse or require "Engine/yarnparse"
Buttons = Buttons or require "Engine/buttons"
Actor = Actor or require "Engine/actor"
CameraShake = CameraShake or require "Engine/CameraShake"
Slider = Slider or require "Engine/sliders"
Timer = Timer or require "Engine/timer"
State = State or require "Engine/state"
StateMachine = StateMachine or require "Engine/statemachine"
Director = Director or require "Game/Director"
AnimatedActor = AnimatedActor or require "Engine/animatedactor"
Scene = Scene or require "Engine/scene"
AudioManager = AudioManager or require "Engine/audioManager"
Intro_01 = Intro_01 or require "Game/Intros/Intro_01"
Intro_02 = Intro_02 or require "Game/Intros/Intro_02"
Intro_03 = Intro_03 or require "Game/Intros/Intro_03"
Menu = Menu or require "Game/Menu"
Settings = Settings or require "Game/Settings"

--#endregion
--#region WINDOW
WW, WH = love.graphics.getDimensions()
--#endregion
--#region ACTORS
LAYERS = {"Background", "Middle", "Front", "HUD"}
DEFAULT_IMAGE = love.graphics.newImage("Data/Default.png")
--#endregion
--#region SPRITES
    --#region LOGOS
    LOVE2D_ICON = love.graphics.newImage("Data/Logos/love2d_icon.png")
    YARN_ICON = love.graphics.newImage("Data/Logos/yarn_icon.png")
    --#endregion
--#endregion
--#region FIELD

--#endregion
--#region FONTS
FONT_OTAKU_TITLE = love.graphics.newFont("/Data/otaku.ttf", 55)
FONT_OTAKU_BUTTONS = love.graphics.newFont("/Data/otaku.ttf", 32)
--#endregion
--#region TITLES

--#endregion
--#region AUDIOS
AUDIO_BUTTON_CLICK = love.audio.newSource("/Data/click.mp3", "static")
--#endregion
--#region SETTINGS

--#endregion

