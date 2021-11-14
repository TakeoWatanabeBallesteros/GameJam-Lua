--Takeo Watanabe y Jan de Nobel
Pong_AudioManager = Pong_Object:extend()

function Pong_AudioManager.PlaySound(source, volume, loop)
    source:setVolume(volume)
    source:setLooping(loop)
    source:play()
end
function Pong_AudioManager.StopSound(soruce)
    soruce:stop()
end
return Pong_AudioManager