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
  end

  function SaveManager:saveSettings()
    local settings = {}
    settings.mainVolume = GAME_SETTINGS_VOLUME_MASTER
    settings.musicVolume = GAME_SETTINGS_VOLUME_MUSIC
    settings.effectVolume = GAME_SETTINGS_VOLUME_EFFECTS
    
    love.filesystem.write("settings.txt", Serialize(settings))
  end

  return SaveManager