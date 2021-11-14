--Takeo Watanabe y Jan de Nobel
--#region ALL_CLASES
Pong_Object = Pong_Object or require "Engine_Pong/object"
Pong_FSM = Pong_FSM or require('Engine_Pong/fsm')
Pong_Vector = Pong_Vector or require "Engine_Pong/vector"
Pong_Scene = Pong_Scene or require "Engine_Pong/scene"
Pong_Actor = Pong_Actor or require "Engine_Pong/actor"
Pong_AudioManager = Pong_AudioManager or require "Engine_Pong/audioManager"
Pong_Field = Pong_Field or require "Game_Pomg/Field"
Pong_Director = Pong_Director or require "Game_Pomg/Director"
Pong_PaddleP1 = Pong_PaddleP1 or require "Game_Pomg/PaddleP1"
Pong_PaddleP2 = Pong_PaddleP2 or require "Game_Pomg/PaddleP2"
Pong_Ball = Pong_Ball or require "Game_Pomg/Ball"
Pong_Settings = Pong_Settings or require "Game_Pomg/Settings"
Pong_HUD = Pong_HUD or require "Game_Pomg/HUD"
Pong_CameraShake = Pong_CameraShake or require "Game_Pomg/CameraShake"
Pong_Intro = Pong_Intro or require "Game_Pomg/Intro"
Pong_Menu = Pong_Menu or require "Game_Pomg/Menu"
Pong_GameOver = Pong_GameOver or require "Game_Pomg/GameOver"
Pong_GameSelect = Pong_GameSelect or require "Game_Pomg/GameSelect"
--#endregion
--#region WINDOW
--#endregion
--#region ACTORS
Pong_LAYERS = {"Background", "Middle", "Front", "HUD"}
Pong_DEFAULT_IMAGE = love.graphics.newImage("Pong/Default.png")
--#endregion
--#region BAll
Pong_BALL_IMAGE_DEFAULT = love.graphics.newImage("Pong/Ball1.png")
Pong_BALL_IMAGE_BRAZIL = love.graphics.newImage("Pong/Ball2.png")
Pong_BALL_IMAGE_OTAKU = love.graphics.newImage("Pong/BallOtaku.png")
Pong_BALL_INITIAL_SPEED = 750
Pong_BALL_MAX_BOUNCE_ANGLE = 5*math.pi/12
--#endregion
--#region PADDLE
Pong_PADDLE_WIDTH = 10
Pong_PADDLE_HEIGHT = 50
Pong_PADDLE_IMAGE_DEFAULT = love.graphics.newImage("Pong/Paddle.png")
Pong_PADDLE_IMAGE_OTAKU = love.graphics.newImage("Pong/PaddleOtaku.png")
Pong_PADDLE_IMAGE_BRAZIL = love.graphics.newImage("Pong/PaddleBrazil.png")
Pong_PADDLE_INITIAL_SPEED = 740
--#region PLAYER_1
Pong_PLAYER_1_INITIAL_X = 45
Pong_PLAYER_1_INITIAL_Y = WH/2
--#endregion
--#region PLAYER_2
Pong_PVP = false
Pong_PLAYER_2_INITIAL_X = WW - 45
Pong_PLAYER_2_INITIAL_Y = WH/2
--#endregion
--#endregion
--#region FIELD
Pong_FIELD_DEFAULT_IMAGE = love.graphics.newImage("Pong/NormalField.png")
Pong_FIELD_BRAZIL_IMAGE = love.graphics.newImage("Pong/BrazilField.png")
Pong_FIELD_OTAKU_IMAGE = love.graphics.newImage("Pong/OtakuField.png")
--#endregion
--#region FONTS
Pong_FONT_PONG_TITLE = love.graphics.newFont("Pong/pong.ttf", 55)
Pong_FONT_OTAKU_TITLE = love.graphics.newFont("Pong/otaku.ttf", 55)
Pong_FONT_PONG_BUTTONS = love.graphics.newFont("Pong/pong.ttf", 32)
Pong_FONT_OTAKU_BUTTONS = love.graphics.newFont("Pong/otaku.ttf", 32)
--#endregion
--#region TITLES
Pong_TITLE_DEFAULT = 'PONG'
Pong_TITLE_OTAKU = 'ポンぐ'
--#endregion
--#region AUDIOS
Pong_AUDIO_GAME_MUSIC_DEFAULT = love.audio.newSource("Pong/musicdefault.ogg", "static")
Pong_AUDIO_PONG_PADDLE_DEFAULT = love.audio.newSource("Pong/pongbouncesfx.ogg", "static")
Pong_AUDIO_PONG_WALL_DEFAULT = love.audio.newSource("Pong/wallbouncesfx.ogg", 'static')
Pong_AUDIO_PONG_GOAL_DEFAULT = love.audio.newSource("Pong/ponggoal.ogg", 'static')
Pong_AUDIO_GAME_MUSIC_OTAKU = love.audio.newSource("Pong/musicotaku.mp3", "static")
Pong_AUDIO_PONG_PADDLE_OTAKU = love.audio.newSource("Pong/pongpaddleotaku.mp3", "static")
Pong_AUDIO_PONG_WALL_OTAKU = love.audio.newSource("Pong/pongwallotaku.mp3", 'static')
Pong_AUDIO_PONG_GOAL_OTAKU = love.audio.newSource("Pong/ponggoalotaku.ogg", 'static')
Pong_AUDIO_GAME_MUSIC_BRAZIL = love.audio.newSource("Pong/musicbrazil.mp3", "static")
Pong_AUDIO_PONG_PADDLE_BRAZIL = love.audio.newSource("Pong/pongpaddlebrazil.ogg", "static")
Pong_AUDIO_PONG_WALL_BRAZIL = love.audio.newSource("Pong/pongwallbrazil.mp3", 'static')
Pong_AUDIO_PONG_GOAL_BRAZIL = love.audio.newSource("Pong/ponggoalbrazil.ogg", 'static')
Pong_AUDIO_BUTTON_CLICK = love.audio.newSource("Pong/click.mp3", "static")
--#endregion
--#region SETTINGS
Pong_SETTINGS_FIELD_SPRITE = Pong_FIELD_DEFAULT_IMAGE
Pong_SETTINGS_PADDLE_SPRITE = Pong_PADDLE_IMAGE_DEFAULT
Pong_SETTING_BALL_SPRITE = Pong_BALL_IMAGE_DEFAULT
Pong_SETTINGS_AUDIO_GAME_MUSIC = Pong_AUDIO_GAME_MUSIC_DEFAULT
Pong_SETTINGS_AUDIO_PONG_PADDLE = Pong_AUDIO_PONG_PADDLE_DEFAULT
Pong_SETTINGS_AUDIO_PONG_WALL = Pong_AUDIO_PONG_WALL_DEFAULT
Pong_SETTINGS_AUDIO_PONG_GOAL = Pong_AUDIO_PONG_GOAL_DEFAULT
Pong_SETTINGS_FONT_TITLE = Pong_FONT_PONG_TITLE
Pong_SETTINGS_FONT_BUTTONS = Pong_FONT_PONG_BUTTONS
Pong_SETTINGS_TITLE = Pong_TITLE_DEFAULT
Pong_SETTINGS_GAME_TYPE = 5
Pong_SETTINGS_WIN_OR_LOSE = 'DEFEATED'
--#endregion
