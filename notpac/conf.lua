function love.conf( t )
    t.title             = "not pacman"
    t.author            = "devbug"
    t.identity          = "notpac"
    t.version           = "0.7.2"
    t.console           = true
    t.release           = false
    t.screen.width      = 800
    t.screen.height     = 600
    t.screen.fullscreen = false
    t.screen.vsync      = true
    t.screen.fsaa       = 0
    t.modules.joystick  = false
    t.modules.audio     = true
    t.modules.keyboard  = true
    t.modules.event     = true
    t.modules.image     = true
    t.modules.graphics  = true
    t.modules.timer     = true
    t.modules.mouse     = true
    t.modules.sound     = true
    t.modules.physics   = false
end