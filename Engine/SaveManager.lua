SaveManager = Object:extend()

function SaveManager:load()
  if not love.filesystem.getInfo("settings.txt") then
    local settings = {}
    settings.mainVolume = 0.6
    settings.musicVolume = 0.6
    settings.effectVolume = 0.6

    love.filesystem.write("settings.txt", Serialize(settings))
  end

  local chunk = love.filesystem.load("settings.txt")
  self.settings = chunk()
  GAME_SETTINGS_VOLUME_MASTER = self.settings.mainVolume
  GAME_SETTINGS_VOLUME_MUSIC = self.settings.musicVolume
  GAME_SETTINGS_VOLUME_EFFECTS = self.settings.effectVolume

  if not love.filesystem.getInfo("characters_fucked.txt") then
    local characters_fucked = {}
    characters_fucked.alex = false
    characters_fucked.ricky = false
    characters_fucked.takeo = false
    characters_fucked.arnau= false
    characters_fucked.vero = false
    characters_fucked.marina = false

    love.filesystem.write("characters_fucked.txt", Serialize(characters_fucked))
  end

  local chunk = love.filesystem.load("characters_fucked.txt")
  self.characters_fucked = chunk()
        CHARACTER_ALEX   =   self.characters_fucked.alex
        CHARACTER_RICKY  = self.characters_fucked.ricky
        CHARACTER_TAKEO  = self.characters_fucked.takeo
        CHARACTER_ARNAU  = self.characters_fucked.arnau
        CHARACTER_VERO   = self.characters_fucked.vero
        CHARACTER_MARINA =   self.characters_fucked.marina
end

function SaveManager:loadAvatar_1()
  if not love.filesystem.getInfo("avatar_1.txt") then
    local avatar_1 = {}
    avatar_1.name = "Nombre"
    avatar_1.skin = 1
    avatar_1.eyes = 1
    avatar_1.hair = 1
    avatar_1.cloth = 1

    love.filesystem.write("avatar_1.txt", Serialize(avatar_1))
  end

  local chunk = love.filesystem.load("avatar_1.txt")
  self.avatar_1 = chunk()
  AVATAR_1_SETTINGS_NAME = self.avatar_1.name
  AVATAR_1_SETTINGS_SKINS = self.avatar_1.skin
  AVATAR_1_SETTINGS_EYES = self.avatar_1.eyes
  AVATAR_1_SETTINGS_HAIRS = self.avatar_1.hair
  AVATAR_1_SETTINGS_CLOTHES = self.avatar_1.cloth

  AVATAR_SETTINGS_NAME = self.avatar_1.name
  AVATAR_SETTINGS_SKIN = self.avatar_1.skin
  AVATAR_SETTINGS_EYE = self.avatar_1.eyes
  AVATAR_SETTINGS_HAIR = self.avatar_1.hair
  AVATAR_SETTINGS_CLOTH = self.avatar_1.cloth

  return AVATAR_1_SETTINGS_NAME
end

function SaveManager:loadAvatar_2()
  if not love.filesystem.getInfo("avatar_2.txt") then
    local avatar_2 = {}
    avatar_2.name = "Nombre"
    avatar_2.skin = 1
    avatar_2.eyes = 1
    avatar_2.hair = 1
    avatar_2.cloth = 1

    love.filesystem.write("avatar_2.txt", Serialize(avatar_2))
  end

  local chunk = love.filesystem.load("avatar_2.txt")
  self.avatar_2 = chunk()
  AVATAR_2_SETTINGS_NAME = self.avatar_2.name
  AVATAR_2_SETTINGS_SKINS = self.avatar_2.skin
  AVATAR_2_SETTINGS_EYES = self.avatar_2.eyes
  AVATAR_2_SETTINGS_HAIRS = self.avatar_2.hair
  AVATAR_2_SETTINGS_CLOTHES = self.avatar_2.cloth

  AVATAR_SETTINGS_NAME = self.avatar_2.name
  AVATAR_SETTINGS_SKIN = self.avatar_2.skin
  AVATAR_SETTINGS_EYE = self.avatar_2.eyes
  AVATAR_SETTINGS_HAIR = self.avatar_2.hair
  AVATAR_SETTINGS_CLOTH = self.avatar_2.cloth

  return AVATAR_2_SETTINGS_NAME
end

function SaveManager:loadAvatar_3()
  if not love.filesystem.getInfo("avatar_3.txt") then
    local avatar_3 = {}
    avatar_3.name = "Nombre"
    avatar_3.skin = 1
    avatar_3.eyes = 1
    avatar_3.hair = 1
    avatar_3.cloth = 1

    love.filesystem.write("avatar_3.txt", Serialize(avatar_3))
  end

  local chunk = love.filesystem.load("avatar_3.txt")
  self.avatar_3 = chunk()
  AVATAR_3_SETTINGS_NAME = self.avatar_3.name
  AVATAR_3_SETTINGS_SKINS = self.avatar_3.skin
  AVATAR_3_SETTINGS_EYES = self.avatar_3.eyes
  AVATAR_3_SETTINGS_HAIRS = self.avatar_3.hair
  AVATAR_3_SETTINGS_CLOTHES = self.avatar_3.cloth

  AVATAR_SETTINGS_NAME = self.avatar_3.name
  AVATAR_SETTINGS_SKIN = self.avatar_3.skin
  AVATAR_SETTINGS_EYE = self.avatar_3.eyes
  AVATAR_SETTINGS_HAIR = self.avatar_3.hair
  AVATAR_SETTINGS_CLOTH = self.avatar_3.cloth

  return AVATAR_3_SETTINGS_NAME
end

function SaveManager:saveSettings()
  local settings = {}
  settings.mainVolume = GAME_SETTINGS_VOLUME_MASTER
  settings.musicVolume = GAME_SETTINGS_VOLUME_MUSIC
  settings.effectVolume = GAME_SETTINGS_VOLUME_EFFECTS
  
  love.filesystem.write("settings.txt", Serialize(settings))

  local characters_fucked = {}
    characters_fucked.alex =   CHARACTER_ALEX  
    characters_fucked.ricky =  CHARACTER_RICKY 
    characters_fucked.takeo =  CHARACTER_TAKEO 
    characters_fucked.arnau=   CHARACTER_ARNAU 
    characters_fucked.vero =   CHARACTER_VERO  
    characters_fucked.marina = CHARACTER_MARINA

    love.filesystem.write("characters_fucked.txt", Serialize(characters_fucked))
end

function SaveManager:saveAvatar_1()
  local avatar = {}
  avatar.name = AVATAR_SETTINGS_NAME
  avatar.skin = AVATAR_SETTINGS_SKIN
  avatar.eyes = AVATAR_SETTINGS_EYE
  avatar.hair = AVATAR_SETTINGS_HAIR
  avatar.cloth = AVATAR_SETTINGS_CLOTH
  love.filesystem.write("avatar_1.txt", Serialize(avatar))
end

function SaveManager:saveAvatar_2()
  local avatar = {}
  avatar.name = AVATAR_SETTINGS_NAME
  avatar.skin = AVATAR_SETTINGS_SKIN
  avatar.eyes = AVATAR_SETTINGS_EYE
  avatar.hair = AVATAR_SETTINGS_HAIR
  avatar.cloth = AVATAR_SETTINGS_CLOTH
  love.filesystem.write("avatar_2.txt", Serialize(avatar))
end

function SaveManager:saveAvatar_3()
  local avatar = {}
  avatar.name = AVATAR_SETTINGS_NAME
  avatar.skin = AVATAR_SETTINGS_SKIN
  avatar.eyes = AVATAR_SETTINGS_EYE
  avatar.hair = AVATAR_SETTINGS_HAIR
  avatar.cloth = AVATAR_SETTINGS_CLOTH
  love.filesystem.write("avatar_3.txt", Serialize(avatar))
end

function SaveManager:deleteAvatar_1()
  love.filesystem.remove("avatar_1.txt")
end

function SaveManager:deleteAvatar_2()
  love.filesystem.remove("avatar_2.txt")
end

function SaveManager:deleteAvatar_3()
  love.filesystem.remove("avatar_3.txt")
end

function SaveManager:checkFile(path)
  if love.filesystem.getInfo(tostring(path)) then return true end
  return false
end

return SaveManager