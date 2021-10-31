--Takeo Watanabe
AudioManager = Object:extend()

function AudioManager.PlaySound(source, volume, loop)
    source:setVolume(volume)
    source:setLooping(loop)
    source:play()
end
function AudioManager.StopSound(soruce)
    soruce:stop()
end
return AudioManager