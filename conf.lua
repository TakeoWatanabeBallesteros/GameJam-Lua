--Takeo Watanabe y Jan de Nobel
function love.conf(t)
  t.identity = love.filesystem.getIdentity()
  t.window.width = 1600
  t.window.height = 900
  t.console = true
  t.vsync = true
  t.title = "TecnoDating"
  t.window.icon = "Data/Logos/Logo_gamejam_256.png"
end
