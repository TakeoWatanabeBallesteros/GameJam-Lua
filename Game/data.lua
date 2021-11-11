--Takeo Watanabe
--#region WINDOW
WW, WH = love.graphics.getDimensions()
--#endregion

--#region AVATAR_ARRAYS
local skins_colors = {'clara', 'intermedia', 'oscura'}
local eyes_colors = {'verde', 'azul', 'magenta', 'marron', 'morado'}
local hairs_types = {'pelado', 'corto', 'mediamelena', 'largo', 'recogido'}
local hairs_colors = {'azul', 'magenta', 'marron', 'rojo', 'rubio', 'verde'}
local clothes_types = {'camisa', 'camiseta', 'cuelloalto', 'jersey', 'peto', 'sudadera'}
--#endregion
--#region CHARACTERS_NAMES
local characters_names = {'player_1','Takeo', 'Alex', 'Ricky', 'Arnau', 'Vero', 'Marina'}
--#endregion

--#region ALL_CLASES
Serialize = Serialize or require "Engine/ser"
Suit = Suit or require "suit"
Vector = Vector or require "Engine/vector"
Object = Object or require "Engine/object"
SplashLib = SplashLib or require ("Engine/o-ten-one")
SaveManager = SaveManager or require "Engine/SaveManager"
JSON = JSON or require "Engine/json/json"
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
Dialog = Dialog or require "Game/Dialog"

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
    --#region AVATAR_SPRITES
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
    --#region DIALOG_BOXES
    DIALOG_BOXES = {}
    for index, value in ipairs(characters_names) do
        DIALOG_BOXES[value] = love.graphics.newImage("Data/Dialog_Boxes/cartel_"..value..".png")
    end
    --#endregion

--#endregion
--#region DIALOGUES_JSON

--#endregion
--#region FONTS
FONT_OTAKU_TITLE = love.graphics.newFont("/Data/Fonts/otaku.ttf", 55)
FONT_OTAKU_BUTTONS = love.graphics.newFont("/Data/Fonts/otaku.ttf", 32)
FONT_DIALOGUES_DEFAULT = love.graphics.newFont("/Data/Fonts/Burbin Casual NC.ttf", 29)
--#endregion
--#region TITLES

--#endregion
--#region AUDIOS
AUDIO_BUTTON_CLICK = love.audio.newSource("/Data/click.mp3", "static")
--#endregion
--#region SETTINGS
    --#region GAME_SETTINGS
    GAME_SETTINGS_VOLUME_MASTER = 0.6
    GAME_SETTINGS_VOLUME_MUSIC = 0.6
    GAME_SETTINGS_VOLUME_EFFECTS = 0.6
    --#region AVATAR_SETTINGS
    AVATAR_SETTINGS_NAME = "default"
    AVATAR_SETTINGS_SKINS = 1
    AVATAR_SETTINGS_EYES = 1
    AVATAR_SETTINGS_HAIRS = 1
    AVATAR_SETTINGS_CLOTHES = 1
    --#endregion
--#endregion


--#region TOPOGAME
    --#region REQUIRES
    --BACKGROUND_TOPO_GAME = BACKGROUND_TOPO_GAME or require "Game/Minijuego_Topo/background"
    --MAZO_TOPO_GAME = MAZO_TOPO_GAME or require "Game/Minijuego_Topo/Mazo"
    --TOPO_TOPO_GAME = TOPO_TOPO_GAME or require "Game/Minijuego_Topo/topo"
    --#endregion
--BACKGROUND_IMAGE_TOPO_GAME = love.graphics.newImage("Data/mjWackAMoleGameTexture/background.png")

--MazoNoHit_IMAGE_TOPO_GAME = love.graphics.newImage("Data/mjWackAMoleGameTexture/MazoNoHit.png")
--MazoHit_IMAGE_TOPO_GAME = love.graphics.newImage("Data/mjWackAMoleGameTexture/MazoHit.png")


--SHADOW_IMAGE_TOPO_GAME = love.graphics.newImage("Data/mjWackAMoleGameTexture/shadow.png")

--TOPO_IMAGE_TOPO_GAME = love.graphics.newImage("Data/mjWackAMoleGameTexture/topo.png")

--#endregion

--#region BLACKJACK
local suits = {'club', 'diamond', 'heart', 'spade'}
local values = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'king', 'queen', 'ace'}
    --#region SPRITES
    BLACKJACK_BACKGROUND = love.graphics.newImage("Data/Blackjack_Textures/Blackjack_table.jpg")
    CARDS={}
    for index, suit in ipairs(suits) do
        CARDS[suit] = {}
        for index, value in ipairs(values) do
            table.insert(CARDS[suit], love.graphics.newImage("Data/Blackjack_Textures/Cards/"..suit.."_"..value..".png"))
        end
    end
    CARD_BACK = love.graphics.newImage("Data/Blackjack_Textures/Cards/pattern1.png")
    --#endregion
    --#region REQUIRES
    Blackjack_Background = Blackjack_Background or require "Game/Minijuego_Blackjack/Blackjack_Background"
    Blackjack_Player = Blackjack_Player or require "Game/Minijuego_Blackjack/Blackjack_Player"
    Blackjack_Dealer = Blackjack_Dealer or require "Game/Minijuego_Blackjack/Blackjack_Dealer"
    Blackjack_Manager = Blackjack_Manager or require "Game/Minijuego_Blackjack/Blackjack_Manager"
    --#endregion

--#endregion

--#region PROGRAMAR
    --#region REQUIRES
    Programar_Manager = Programar_Manager or require "Game/Minijuego_Programar/Programar_Manager"
    --#endregion


--#endregion

--#region DrinkingGame
    --#region Sprites
    SAD_FACE_DRINKINGAME = love.graphics.newImage("data/Vodka_Textures/SadFace.png")
    BACKGROUND_DRINKINGAME_0 = love.graphics.newImage("data/Vodka_Textures/0shots.png")
    BACKGROUND_DRINKINGAME_1 = love.graphics.newImage("data/Vodka_Textures/1shots.png")
    BACKGROUND_DRINKINGAME_2 = love.graphics.newImage("data/Vodka_Textures/2shots.png")
    BACKGROUND_DRINKINGAME_3 = love.graphics.newImage("data/Vodka_Textures/3shots.png")
    BACKGROUND_DRINKINGAME_4 = love.graphics.newImage("data/Vodka_Textures/4shots.png")
    BACKGROUND_DRINKINGAME_5 = love.graphics.newImage("data/Vodka_Textures/5shots.png")
    BACKGROUND_DRINKINGAME_6 = love.graphics.newImage("data/Vodka_Textures/6shots.png")
    BACKGROUND_DRINKINGAME_7 = love.graphics.newImage("data/Vodka_Textures/7shots.png")
    BACKGROUND_DRINKINGAME_8 = love.graphics.newImage("data/Vodka_Textures/8shots.png")
    BACKGROUND_DRINKINGAME_9 = love.graphics.newImage("data/Vodka_Textures/9shots.png")
    BACKGROUND_DRINKINGAME_Drinking = love.graphics.newImage("data/Vodka_Textures/Drinking.png")
    SLIDER_DRINKINGAME = love.graphics.newImage("data/Vodka_Textures/Slider.png")
    PLAYERBAR_DRINKINGAME = love.graphics.newImage("data/Vodka_Textures/playerBar.png")
    --#endregion
    --#region requires
    BACKGROUND_DRINKING_GAME = BACKGROUND_DRINKING_GAME or require "Game/Minijuego_Vodka/BackgroundDrinkinGame"
    SLIDER_DRINKING_GAME = SLIDER_DRINKING_GAME or require "Game/Minijuego_Vodka/SliderDrinkingGame"
    DRINKING_GAME = DRINKING_GAME or require "Game/Minijuego_Vodka/DrinkingGame"
    PLAYERBAR_DRINKING_GAME = PLAYERBAR_DRINKING_GAME or require "Game/Minijuego_Vodka/PlayerBarDrinkingGame"
--#endregion

--#endregion
