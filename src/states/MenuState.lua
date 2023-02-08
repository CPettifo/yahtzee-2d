local positions = {}

MenuState = Class{__includes = BaseState}

function MenuState:init()

    self.currentMenuItem = 1

    self.letterTable = {
        {'Y', -129},
        {'A', -100},
        {'H', -68},
        {'T', -40},
        {'Z', -15},
        {'E', 10},
        {'E', 37},
        {'-', 70},
        {'2', 100},
        {'D', 130}
    }

end

function MenuState:enter()
end

function MenuState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        self.currentMenuItem = self.currentMenuItem == 1 and 2 or 1
        --gSounds['menu']:play()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if self.currentMenuItem == 1 then
            gStateMachine:change('play', {
                turn = 1
            })
        else
            love.event.quit()
        end
    end
end

function MenuState:render()
    self:drawMenuText(-50)
    self:drawOptions(12)

end

function MenuState:drawMenuText(y)

    love.graphics.setColor(1, 1, 1, 128/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 76, VIRTUAL_HEIGHT / 2 + y - 11, 150, 58, 6)

    love.graphics.setFont(gFonts['large'])


    love.graphics.setColor(255, 255, 255, 255)
    for i = 1, 10 do
        love.graphics.printf(self.letterTable[i][1], 0, VIRTUAL_HEIGHT / 2 +y,
            VIRTUAL_WIDTH + self.letterTable[i][2], 'center')
    end
end


function MenuState:drawOptions(y)

    love.graphics.setColor(1, 1, 1, 128/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 76, VIRTUAL_HEIGHT / 2 + y, 150, 58, 6)

    love.graphics.setFont(gFonts['medium'])
    
    if self.currentMenuItem == 1 then
        love.graphics.setColor(99/255, 155/255, 1, 1)
    else
        love.graphics.setColor(48/255, 96/255, 130/255, 1)
    end

    love.graphics.printf('Start', 0, VIRTUAL_HEIGHT / 2 + y + 8, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    if self.currentMenuItem == 2 then
        love.graphics.setColor(99/255, 155/255, 1, 1)
    else
        love.graphics.setColor(48/255, 96/255, 130/255, 1)
    end

    love.graphics.printf('Quit', 0, VIRTUAL_HEIGHT / 2 + y + 33, VIRTUAL_WIDTH, 'center')
end