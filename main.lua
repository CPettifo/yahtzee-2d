
-- Don't allow love to blur my pixellated graphics
love.graphics.setDefaultFilter('nearest', 'nearest')

-- load all dependencies from Dependencies.lua
require 'src/Dependencies'


-- set the window dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- and the virtual dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

function love.load()

    -- set the title of the window
    love.window.setTitle('Yahtzee-2d')

    -- seed the random number generator with operating system time
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true,
        canvas = true
    })

    -- Here I will turn the music on and loop it
    -- gSounds['music']:setLooping(true)
    -- gSounds['music']:play()

    --start the good 'ol state machine

    gStateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
        ['play'] = function() return PlayState() end,
        ['reroll'] = function() return RerollState() end,
        ['results'] = function() return ResultsState() end
    }
    gStateMachine:change('menu')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    gStateMachine:render()
    push:finish()
end