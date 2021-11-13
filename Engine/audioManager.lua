--Takeo Watanabe
AudioManager = Object:extend()

function AudioManager.PlaySound(source, volume, loop)
    local clone = source:clone()
    clone:setVolume(volume)
    clone:setLooping(loop)
    clone:play()
end

function AudioManager.PlayMusic(source, volume, loop)
    source:setVolume(volume)
    source:setLooping(loop)
    source:play()
end

function AudioManager.StopSound(soruce)
    soruce:stop()
end

return AudioManager