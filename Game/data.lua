--Takeo Watanabe
--#region WINDOW
WW, WH = love.graphics.getDimensions()
--#endregion


--#region AVATAR_ARRAYS
local skins_colors = {'clara', 'intermedia', 'intermedia2', 'intermedia3', 'oscura', 'oscura2'}
local eyes_colors = {'verde', 'azul', 'magenta', 'marron', 'morado'}
local hairs_types = {'pelado', 'corto', 'mediamelena', 'largo', 'recogido'}
local hairs_colors = {'azul', 'magenta', 'marron', 'oscuro','rojo', 'rubio', 'verde'}
local clothes_types = {'camisa', 'camiseta', 'cuelloalto', 'jersey', 'peto', 'sudadera'}
--#endregion
--#region CHARACTERS_NAMES
local characters_boxes_names = {'player_1','Takeo', 'Alex', 'Ricky', 'Arnau', 'Vero', 'Marina'}
local characters_names = {'takeo', 'alex', 'ricky', 'arnau', 'vero', 'marina'}
--#endregion
--#region MINIGAMES_NAMES
local minigames_names = {'beber', 'blackjack', 'clase', 'gancho', 'pong', 'programar', 'topo'}
--#endregion

--#region ALL_CLASES
Discord_RPC = Discord_RPC or require "Engine/discordRPC"
Serialize = Serialize or require "Engine/ser"
Suit = Suit or require "suit"
Vector = Vector or require "Engine/vector"
Object = Object or require "Engine/object"
SplashLib = SplashLib or require ("Engine/o-ten-one")
SaveManager = SaveManager or require "Engine/SaveManager"
JSON = JSON or require "Engine/json/json"
Yarnparse = Yarnparse or require "Engine/yarnparse"
Actor = Actor or require "Engine/actor"
CameraShake = CameraShake or require "Engine/CameraShake"
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
Intro_04 = Intro_04 or require "Game/Intros/Intro_04"
Menu = Menu or require "Game/Menu"
Menu_Characters = Menu_Characters or require "Game/Menu_Characters"
Settings = Settings or require "Game/Settings"
Editor = Editor or require "Game/Editor"
Dialog = Dialog or require "Game/Dialog"
Menu_Avatar = Menu_Avatar or require "Game/Menu_Avatar"
Menu_Minigames = Menu_Minigames or require "Game/Menu_Minigames"
Characters_Selection = Characters_Selection or require "Game/Characters_Selection"
--#endregion
MINIGAME = false
--#region ACTORS
LAYERS = {"Background", "Middle", "Front", "HUD", "Buttons"}
DEFAULT_IMAGE = love.graphics.newImage("Data/Default.png")
--#endregion
--#region SPRITES
    --#region LOGOS
    LOVE2D_ICON = love.graphics.newImage("Data/Logos/love2d_icon.png")
    YARN_ICON = love.graphics.newImage("Data/Logos/yarn_icon.png")
    TALKATIVE_LOGO = love.graphics.newImage("Data/Logos/logo_empresa.png")
    --#endregion
    --#region BACKGROUNDS
    MENU_BACKGROUND = love.graphics.newImage("Data/UI_Backgrounds/menu_background.png")
    MINIGAMES_BUTTONS_UI = love.graphics.newImage("Data/Menu_Minijuegos/menu_minijuego.png")
    DEFAULT_BACKGROUND = love.graphics.newImage("Data/UI_Backgrounds/default_background.png")
    EDITOR_BACKGROUND = love.graphics.newImage("Data/UI_Backgrounds/fondo_custom.png")

    DIALOGUES_BACKGROUNDS = {}
    DIALOGUES_BACKGROUNDS["arcade"] = love.graphics.newImage("Data/Dialogues_Backgrounds/arcade_background.png")
    DIALOGUES_BACKGROUNDS["clase"] = love.graphics.newImage("Data/Dialogues_Backgrounds/clase_background.png")
    DIALOGUES_BACKGROUNDS["intro"] = love.graphics.newImage("Data/Dialogues_Backgrounds/intro_background.png")
    DIALOGUES_BACKGROUNDS["party"] = love.graphics.newImage("Data/Dialogues_Backgrounds/party_background.png")
    --#endregion
    --#region MINIGAMES_TUTORIALS
    MINIGAMES_TUTORIALS = {}
    for k,v in ipairs(minigames_names) do
        MINIGAMES_TUTORIALS[v] = love.graphics.newImage("Data/Minigames_Tutorials/como_jugar_"..v..".png")
    end
    --#endregion
    --#region AVATAR_SPRITES
    AVATAR_SILUET = love.graphics.newImage("Data/Avatar/silueta_avatar.png")
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
            for i = 1, 3 do
                table.insert(AVATAR_CLOTHES, love.graphics.newImage("Data/Avatar/Clothes/ropa_"..value.."_"..i..".png"))
            end
        end
        --#endregion
        --#region AVATAR_CHARACTERS
        AVATAR_CHARACTERS = {}
        for index, value in ipairs(characters_names) do
            AVATAR_CHARACTERS[value] = love.graphics.newImage('Data/Avatar/Characters/avatar_'..value..'.png')
        end
        --#endregion
        --#region AVATAR_CHARACTERS_BUTTONS
        AVATAR_CHARACTERS_BUTTONS = {}
        for index, value in ipairs(characters_names) do
            AVATAR_CHARACTERS_BUTTONS[value] = love.graphics.newImage("Data/Avatar/Characters_Buttons/boton_"..value..".png")
        end
        --#endregion
        --#region AVATAR_CHARACTERS_INFO
        AVATAR_CHARACTERS_INFO = {}
        for index, value in ipairs(characters_names) do
            AVATAR_CHARACTERS_INFO[value] = love.graphics.newImage("Data/Avatar/Characters_Info/info_"..value..".png")
        end
        --#endregion
        AVATAR_CHARACTERS_INFO_BAJO = love.graphics.newImage("Data/Avatar/Characters_Info/mitad_inferior.png")
        --#region AVATAR_CHARACTERS_INFO_SILUETA
        AVATAR_CHARACTERS_INFO_SILUETA = {}
        for index, value in ipairs(characters_names) do
            AVATAR_CHARACTERS_INFO_SILUETA[value] = love.graphics.newImage("Data/Avatar/Characters_Info_Silueta/info_"..value.."_silueta.png")
        end
        --#endregion
    --#endregion
    --#region DIALOG_BOXES
    DIALOG_BOXES = {}
    for index, value in ipairs(characters_boxes_names) do
        DIALOG_BOXES[value] = love.graphics.newImage("Data/Dialog_Boxes/cartel_"..value..".png")
    end
    --#endregion
--#endregion
--#region DIALOGUES_JSON
ON_PAUSE = false


--#endregion
--#region FONTS
FONT_TITLE = love.graphics.newFont("/Data/Fonts/master_of_break.otf", WW*300/1920)
FONT_TITLE_2 = love.graphics.newFont("/Data/Fonts/kenyan coffee rg.ttf", WW*155/1920)
FONT_BUTTONS = love.graphics.newFont("/Data/Fonts/kenyan coffee rg.ttf", WW*34/1920)
FONT_BUTTONS_BIG = love.graphics.newFont("/Data/Fonts/kenyan coffee rg.ttf", WW*40/1920)
FONT_DIALOGUES_DEFAULT = love.graphics.newFont("/Data/Fonts/Burbin Casual NC.ttf", WW*35/1920)
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
    --#endregion
    --#region CHARACTERS_FUCKED
    CHARACTER_ALEX = false
    CHARACTER_RICKY = false
    CHARACTER_TAKEO = false
    CHARACTER_ARNAU = false
    CHARACTER_MARINA = false
    CHARACTER_VERO = false
    --#endregion
    --#region AVATAR_DATA
    AVATAR_SELECTED = nil
        --#region AVATAR_SETTINGS
        AVATAR_SETTINGS_SPRITES = {}
        AVATAR_SETTINGS_NAME = nil
        AVATAR_SETTINGS_SKIN = nil
        AVATAR_SETTINGS_EYE = nil
        AVATAR_SETTINGS_HAIR = nil
        AVATAR_SETTINGS_CLOTH = nil
        --#endregion
        --#region AVATAR_1_SETTINGS
        AVATAR_1_SETTINGS_NAME = nil
        AVATAR_1_SETTINGS_SKINS = nil
        AVATAR_1_SETTINGS_EYES = nil
        AVATAR_1_SETTINGS_HAIRS = nil
        AVATAR_1_SETTINGS_CLOTHES = nil
        --#endregion
        --#region AVATAR_2_SETTINGS
        AVATAR_2_SETTINGS_NAME = nil
        AVATAR_2_SETTINGS_SKINS = nil
        AVATAR_2_SETTINGS_EYES = nil
        AVATAR_2_SETTINGS_HAIRS = nil
        AVATAR_2_SETTINGS_CLOTHES = nil
        --#endregion
        --#region AVATAR_3_SETTINGS
        AVATAR_3_SETTINGS_NAME = nil
        AVATAR_3_SETTINGS_SKINS = nil
        AVATAR_3_SETTINGS_EYES = nil
        AVATAR_3_SETTINGS_HAIRS = nil
        AVATAR_3_SETTINGS_CLOTHES = nil
        --#endregion
    --#endregion

--#endregion
    --#region REQUIRES
    BACKGROUND_TOPO_GAME = BACKGROUND_TOPO_GAME or require "Game/Minijuego_Topo/background"
    MAZO_TOPO_GAME = MAZO_TOPO_GAME or require "Game/Minijuego_Topo/Mazo"
    TOPO_TOPO_GAME = TOPO_TOPO_GAME or require "Game/Minijuego_Topo/topo"
    --#endregion
    --#region SOUNDS
    HIT_TOPO_SOUND = love.audio.newSource("Data/Topo_Sounds/blip.wav","static")
    MICKEY_MUSIC_TOPO = love.audio.newSource("Data/Topo_Sounds/MickeyMouseSong.mp3","static")
    --#endregion
BACKGROUND_IMAGE_TOPO_GAME = love.graphics.newImage("Data/Topo_Textures/background.png")

MazoNoHit_IMAGE_TOPO_GAME = love.graphics.newImage("Data/Topo_Textures/MazoNoHit.png")
MazoHit_IMAGE_TOPO_GAME = love.graphics.newImage("Data/Topo_Textures/MazoHit.png")


SHADOW_IMAGE_TOPO_GAME = love.graphics.newImage("Data/Topo_Textures/shadow.png")

TOPO_IMAGE_TOPO_GAME = love.graphics.newImage("Data/Topo_Textures/topo.png")

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
    Programar_Manager_ = Programar_Manager_ or require "Game/Minijuego_Programar/Programar_Manager"
    --#endregion
PROGRAMAR_VIDAS = {
    love.graphics.newImage("Data/Programar_Screens/Program_UI/programar_vida_1.png"),
    love.graphics.newImage("Data/Programar_Screens/Program_UI/programar_vida_2.png"),
    love.graphics.newImage("Data/Programar_Screens/Program_UI/programar_vida_3.png")
}
PROGRAMAR_SCREENS = {}
for i = 1, 2, 1 do
    PROGRAMAR_SCREENS[i] = {}
    for j = 1, 5, 1 do
        PROGRAMAR_SCREENS[i][j] = love.graphics.newImage("Data/Programar_Screens/Code_"..i.."_"..j..".PNG")
    end
end
PROGRAMAR_MAL = love.audio.newSource("Data/Programar_Screens/programar_mal.ogg", 'static')
PROGRAMAR_BIEN = love.audio.newSource("Data/Programar_Screens/programar_bien.ogg", 'static')
--#endregion

--#region DORMIR
Dormir_Manager = Dormir_Manager or require "Game/Minijuego_Dormir/Dormir_Manager"
DORMIR_BACKGROUND = love.graphics.newImage("Data/Dormir_Sprites/background_minijuego_dormir.png")
DORMIR_PROFE_SPRITES = {
    love.graphics.newImage("Data/Dormir_Sprites/profe_espaldas.png"),
    love.graphics.newImage("Data/Dormir_Sprites/profe_frente.png"),
    love.graphics.newImage("Data/Dormir_Sprites/profe_pillado.png")

}
DORMIR_ESCRIBIR = love.audio.newSource("Data/Dormir_Sprites/dormir_escribir.ogg", 'static')
DORMIR_FONT = love.graphics.newFont("Data/Dormir_Sprites/digital-7.ttf", WW*60/1920)

--#endregion

--#region PONG
Pong_Manager = Pong_Manager or require "Game/Minijuego_Pong/Pong_Manager"
--#endregion

--#region DrinkingGame
    --#region Sprites
    SAD_FACE_DRINKINGAME = love.graphics.newImage("Data/Vodka_Textures/SadFace.png")
    BACKGROUND_DRINKINGAME_0 = love.graphics.newImage("Data/Vodka_Textures/0shots.png")
    BACKGROUND_DRINKINGAME_1 = love.graphics.newImage("Data/Vodka_Textures/1shots.png")
    BACKGROUND_DRINKINGAME_2 = love.graphics.newImage("Data/Vodka_Textures/2shots.png")
    BACKGROUND_DRINKINGAME_3 = love.graphics.newImage("Data/Vodka_Textures/3shots.png")
    BACKGROUND_DRINKINGAME_4 = love.graphics.newImage("Data/Vodka_Textures/4shots.png")
    BACKGROUND_DRINKINGAME_5 = love.graphics.newImage("Data/Vodka_Textures/5shots.png")
    BACKGROUND_DRINKINGAME_6 = love.graphics.newImage("Data/Vodka_Textures/6shots.png")
    BACKGROUND_DRINKINGAME_7 = love.graphics.newImage("Data/Vodka_Textures/7shots.png")
    BACKGROUND_DRINKINGAME_8 = love.graphics.newImage("Data/Vodka_Textures/8shots.png")
    BACKGROUND_DRINKINGAME_9 = love.graphics.newImage("Data/Vodka_Textures/9shots.png")
    BACKGROUND_DRINKINGAME_Drinking = love.graphics.newImage("Data/Vodka_Textures/Drinking.png")
    SLIDER_DRINKINGAME = love.graphics.newImage("Data/Vodka_Textures/Slider.png")
    PLAYERBAR_DRINKINGAME = love.graphics.newImage("Data/Vodka_Textures/playerBar.png")
    --#endregion
    --#region sounds
    DRINK_SOUND = love.audio.newSource("Data/Vodka_Sounds/Drinking.mp3","static")
    DISAPPOINTMENT_SOUND = love.audio.newSource("Data/Vodka_Sounds/Disappointment.mp3","static") 
    BACKGROUND_SOUND_DRINKINGAME = love.audio.newSource("Data/Vodka_Sounds/DecapitamoGallina.mp3","static")
    --#endregion
    --#region requires
    BACKGROUND_DRINKING_GAME = BACKGROUND_DRINKING_GAME or require "Game/Minijuego_Vodka/BackgroundDrinkinGame"
    SLIDER_DRINKING_GAME = SLIDER_DRINKING_GAME or require "Game/Minijuego_Vodka/SliderDrinkingGame"
    DRINKING_GAME = DRINKING_GAME or require "Game/Minijuego_Vodka/DrinkingGame"
    PLAYERBAR_DRINKING_GAME = PLAYERBAR_DRINKING_GAME or require "Game/Minijuego_Vodka/PlayerBarDrinkingGame"
    --#endregion
--#endregion

--#region GanchoGame
 GANCHO_BACKGROUND = love.graphics.newImage("Data/Gancho_Textures/background.png")
 GANCHO_PELUCHE_ALEX = love.graphics.newImage("Data/Gancho_Textures/PelucheAleks.png")
 GANCHO_PELUCHE_MARINA = love.graphics.newImage("Data/Gancho_Textures/PelucheMarina.png")
 GANCHO_PELUCHE_ARNAU = love.graphics.newImage("Data/Gancho_Textures/PelucheArnau.png")
 GANCHO_PELUCHE_TAKEO = love.graphics.newImage("Data/Gancho_Textures/PelucheTakeo.png")
 GANCHO_PELUCHE_VERONIKA = love.graphics.newImage("Data/Gancho_Textures/PelucheVeronika.png")
 GANCHO_PELUCHE_RICKY = love.graphics.newImage("Data/Gancho_Textures/PelucheRicky.png")
 GANCHO_GANCHO_ABIERTO = love.graphics.newImage("Data/Gancho_Textures/gancho.png")
 GANCHO_GANCHO_CERRADO = love.graphics.newImage("Data/Gancho_Textures/ganchoCerrado.png")
 GANCHO_SOMBRA = love.graphics.newImage("Data/Gancho_Textures/Shadow.png")

 --#region sounds 
 GANCHO_AUDIO = love.audio.newSource("Data/Gancho_Sounds/MotorSound.mp3","static")
 --#endregion
 --#region font
 TIMER_FONT =love.graphics.newFont("Data/Gancho_Textures/Font.TTF",100)
 love.graphics.setFont(TIMER_FONT)
 --#endregion


 Gancho_Background = Gancho_Background or require "Game/Minijuego_Gancho/Gancho_Background"
 Gancho_Gancho = Gancho_Gancho or require "Game/Minijuego_Gancho/Gancho_Gancho"
 Gancho_Peluche = Gancho_Peluche or require "Game/Minijuego_Gancho/Gancho_Peluche"
Gancho_Manager = Gancho_Manager or require "Game/Minijuego_Gancho/Gancho_Manager"
--#endregion
--#endregion

--#region BeatemUp
--#region sounds
Jumping = love.audio.newSource("Data/BeatemUp_Sounds/player_jump.mp3","static")
Attack = love.audio.newSource("Data/BeatemUp_Sounds/player_attack.mp3","static")
Hit = love.audio.newSource("Data/BeatemUp_Sounds/player_hit.mp3","static")
--#endregion
BeatemUp_Backgroundimg = love.graphics.newImage("Data/Beatemup_Textures/background.png")
player = player or require("Game/Minijuego_Beatemup/BeatemUp_Player")
coin = coin or require("Game/Minijuego_Beatemup/coin")
gui = gui or require("Game/Minijuego_Beatemup/gui")
spike = spike or require("Game/Minijuego_Beatemup/spike")
stone = stone or require("Game/Minijuego_Beatemup/stone")
camera = camera or require("Game/Minijuego_Beatemup/camera")
enemy = enemy or require("Game/Minijuego_Beatemup/enemy")
map = map or require("Game/Minijuego_Beatemup/map")
BeatemUp_Background = BeatemUp_Background or require("Game/Minijuego_Beatemup/BeatemUp_Background")
BeatemUp_Manager = BeatemUp_Manager or require("Game/Minijuego_Beatemup/BeatemUp_Manager")
--#endregion

--#region SPRITES MAPPING
function GenerateImageButton(name)
    local function alpha( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,1
        end
        return r,g,b,a
     end

    local function alpha2( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,0.7
        end
        return r,g,b,a
     end
    
    local function alpha3( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,a
        end
        return r,g,b,a
     end

    local normal, hovered, active = love.image.newImageData("Data/Avatar/Characters_Buttons/boton_"..name..".png"), love.image.newImageData("Data/Avatar/Characters_Buttons/boton_"..name..".png"), love.image.newImageData("Data/Avatar/Characters_Buttons/boton_"..name..".png")
    normal:mapPixel(alpha)
    hovered:mapPixel(alpha2)
    active:mapPixel(alpha3)
    CHARACTERS_BUTTONS[name].normal = love.graphics.newImage(normal)
    CHARACTERS_BUTTONS[name].hovered = love.graphics.newImage(hovered)
    CHARACTERS_BUTTONS[name].active = love.graphics.newImage(active)
    CHARACTERS_BUTTONS[name].mask = normal
end

function SPRITES_MAPPING_1()
    CHARACTERS_BUTTONS = {}
    for k,v in ipairs(characters_names) do
        CHARACTERS_BUTTONS[v] = {}
        GenerateImageButton(v)
    end
    SPRITES_MAPPING_2()
end

function GenerateImageButtonMinigames(name)
    local function alpha( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,1
        end
        return r,g,b,a
     end

    local function alpha2( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,0.7
        end
        return r,g,b,a
     end
    
    local function alpha3( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,a
        end
        return r,g,b,a
     end

    local normal, hovered, active = love.image.newImageData("Data/Menu_Minijuegos/menu_minijuego_"..name..".png"), love.image.newImageData("Data/Menu_Minijuegos/menu_minijuego_"..name..".png"), love.image.newImageData("Data/Menu_Minijuegos/menu_minijuego_"..name..".png")
    normal:mapPixel(alpha)
    hovered:mapPixel(alpha2)
    active:mapPixel(alpha3)
    MINIGAMES_BUTTONS[name].normal = love.graphics.newImage(normal)
    MINIGAMES_BUTTONS[name].hovered = love.graphics.newImage(hovered)
    MINIGAMES_BUTTONS[name].active = love.graphics.newImage(active)
    MINIGAMES_BUTTONS[name].mask = normal
end

function SPRITES_MAPPING_4()
    MINIGAMES_BUTTONS = {}
    for k,v in ipairs(minigames_names) do
        MINIGAMES_BUTTONS[v] = {}
        GenerateImageButtonMinigames(v)
    end
end

function GenerateImageButton_Info(name)
    local function alpha( x, y, r, g, b, a )
            if a ~= 0 then return r,g,b,1
            end
            return r,g,b,a
        end

    local function alpha2( x, y, r, g, b, a )
            if a ~= 0 then return r,g,b,0.7
            end
            return r,g,b,a
        end
    
    local function alpha3( x, y, r, g, b, a )
            if a ~= 0 then return r,g,b,a
            end
            return r,g,b,a
        end

    local normal, hovered, active = love.image.newImageData("Data/Avatar/Characters_Info/info_"..name..".png"), love.image.newImageData("Data/Avatar/Characters_Info/info_"..name..".png"), love.image.newImageData("Data/Avatar/Characters_Info/info_"..name..".png")
    normal:mapPixel(alpha)
    hovered:mapPixel(alpha2)
    active:mapPixel(alpha3)
    CHARACTERS_INFO[name].normal = love.graphics.newImage(normal)
    CHARACTERS_INFO[name].hovered = love.graphics.newImage(hovered)
    CHARACTERS_INFO[name].active = love.graphics.newImage(active)
    CHARACTERS_INFO[name].mask = normal
end

function GenerateImageButton_Info2(name)
    local function alpha( x, y, r, g, b, a )
            if a ~= 0 then return r,g,b,1
            end
            return r,g,b,a
        end

    local function alpha2( x, y, r, g, b, a )
            if a ~= 0 then return r,g,b,0.7
            end
            return r,g,b,a
        end
    
    local function alpha3( x, y, r, g, b, a )
            if a ~= 0 then return r,g,b,a
            end
            return r,g,b,a
        end

    local normal, hovered, active = love.image.newImageData("Data/Avatar/Characters_Info_Silueta/info_"..name.."_silueta.png"), love.image.newImageData("Data/Avatar/Characters_Info_Silueta/info_"..name.."_silueta.png"), love.image.newImageData("Data/Avatar/Characters_Info_Silueta/info_"..name.."_silueta.png")
    normal:mapPixel(alpha)
    hovered:mapPixel(alpha2)
    active:mapPixel(alpha3)
    CHARACTERS_INFO_SILUETA[name].normal = love.graphics.newImage(normal)
    CHARACTERS_INFO_SILUETA[name].hovered = love.graphics.newImage(hovered)
    CHARACTERS_INFO_SILUETA[name].active = love.graphics.newImage(active)
    CHARACTERS_INFO_SILUETA[name].mask = normal
end


function SPRITES_MAPPING_2()
    CHARACTERS_INFO = {}
    for k,v in ipairs(characters_names) do
        CHARACTERS_INFO[v] = {}
        GenerateImageButton_Info(v)
        print(CHARACTERS_INFO[v].mask)
    end
    SPRITES_MAPPING_3()
end

function SPRITES_MAPPING_3()
    CHARACTERS_INFO_SILUETA = {}
    for k,v in ipairs(characters_names) do
        CHARACTERS_INFO_SILUETA[v] = {}
        GenerateImageButton_Info2(v)
    end
    SPRITES_MAPPING_4()
end
--#endregion