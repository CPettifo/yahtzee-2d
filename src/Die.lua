Die = Class{}

function Die:init()

    self.value = math.random(6)
    self.reroll = false
    -- will need x and y values for tracking movement
end

function Die:render(x)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf(self.value, 0, VIRTUAL_HEIGHT / 2,
            VIRTUAL_WIDTH + x, 'center')
end