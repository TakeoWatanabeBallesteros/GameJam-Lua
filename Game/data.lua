--Takeo Watanabe
--#region AVATAR_ARRAYS
local skins_colors = {'clara', 'intermedia', 'oscura'}
local eyes_colors = {'verde', 'azul', 'magenta', 'marron', 'morado'}
local hairs_types = {'pelado', 'corto', 'mediamelena', 'largo', 'moño'}
local hairs_colors = {'azul', 'magenta', 'marron', 'rojo', 'rubio', 'verde'}
local clothes_types = {'camisa', 'camiseta', 'cuelloalto', 'jersey', 'peto', 'sudadera'}
--#endregion
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
Editor = Editor or require "Game/Editor"

--#endregion
--#region WINDOW
WW, WH = love.graphics.getDimensions()
--#endregion
--#region ACTORS
LAYERS = {"Background", "Middle", "Front", "HUD", "Buttons"}
DEFAULT_IMAGE = love.graphics.newImage("Data/Default.png")
--#endregion
--#region SPRITES
    --#region LOGOS
    LOVE2D_ICON = love.graphics.newImage("Data/Logos/love2d_icon.png")
    YARN_ICON = love.graphics.newImage("Data/Logos/yarn_icon.png")
    --#endregion
    --#region AVATAR_SKINS
    AVATAR_SKINS = {}
    for index, value in ipairs(skins_colors) do
        table.insert(AVATAR_SKINS, love.graphics.newImage("Data/Avatar/Skins/piel_"..value..".png"))
    end
    --#endregion
    --#region AVATAR_EYES
    AVATAR_EYES = {}
    for index, value in ipairs(eyes_colors) do
        table.insert(AVATAR_EYES, love.graphics.newImage("Data/Avatar/Eyes/ojos_"..value..".png"))
    end
    --#endregion
    --#region AVATAR_HAIRS
    AVATAR_HAIRS = {}
    for index, value in ipairs(hairs_types) do
        for _index, _value in ipairs(hairs_colors) do
            table.insert(AVATAR_HAIRS, love.graphics.newImage("Data/Avatar/Hairs/pelo_"..value.."_".._value..".png"))
        end
    end
    --#endregion
    --#region AVATAR_CLOTHES
    AVATAR_CLOTHES = {}
    for index, value in ipairs(clothes_types) do
        table.insert(AVATAR_CLOTHES, love.graphics.newImage("Data/Avatar/Clothes/ropa_"..value..".png"))
    end
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
    --#region AVATAR_SETTINGS
    AVATAR_SETTINGS_SKINS = 1
    AVATAR_SETTINGS_EYES = 1
    AVATAR_SETTINGS_HAIRS = 1
    AVATAR_SETTINGS_CLOTHES = 1
    --#endregion
--#endregion

