--Takeo Watanabe
--#region ALL_CLASES
Vector = Vector or require "Engine/vector"
Object = Object or require "Engine/object"
Actor = Actor or require "Engine/actor"
AnimatedActor = AnimatedActor or require "Engine/animatedactor"
Scene = Scene or require "Engine/scene"
FSM = FSM or require "Engine/fsm"
AudioManager = AudioManager or require "Engine/audioManager"
Director = Director or require "Game/Director"
Intro = Intro or require "Game/Intro"
Menu = Menu or require "Game/Menu"

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
