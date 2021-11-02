--Takeo Watanabe
--#region ALL_CLASES
Vector = Vector or require "Engine/vector"
Object = Object or require "Engine/object"
Actor = Actor or require "Engine/actor"
Slider = Slider or require "Engine/sliders"
Timer = Timer or require "Engine/timer"
State = State or require "Engine/state"
StateMachine = StateMachine or require "Engine/statemachine"
Director = Director or require "Game/Director"
AnimatedActor = AnimatedActor or require "Engine/animatedactor"
Scene = Scene or require "Engine/scene"
AudioManager = AudioManager or require "Engine/audioManager"
Intro = Intro or require "Game/Intro"
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
--#region Sprites

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

