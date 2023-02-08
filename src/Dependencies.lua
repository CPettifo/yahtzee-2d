Class = require 'lib/class'

push = require 'lib/push'

Timer = require 'lib/knife.timer'


require 'src/StateMachine'

require 'src/Die'
-- require 'src/ScoreCard'


require 'src/states/MenuState'
require 'src/states/PlayState'
require 'src/states/RerollState'
require 'src/states/ResultsState'

gSounds = {

}

gTextures = {

}


gFrames = {

}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}