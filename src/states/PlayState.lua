PlayState = Class{__includes = BaseState}

function PlayState:init()

    self.canInput = true
    self.rolls = 0
    self.debug = false
    self.dice = {}
    self.selected = 1
    self.position = 211
    for i = 1, 5 do
        table.insert(self.dice, Die())
    end
    
end

function PlayState:enter(params)

    self.turn = params.turn

    -- self.scorecard = ScoreCard

end

function PlayState:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    if love.keyboard.wasPressed('x') then
        self.rolls = self.rolls - 1
    end
    if love.keyboard.wasPressed('m') then
        gSounds['music']:pause()
    end
    if love.keyboard.wasPressed(']') then
        self.debug = true
    end
    

    if self.rolls >= 3 then
        -- allocate score and then go to next turn
        print('Three rolls')
        self.rolls = 0
    end

    if self.canInput then
        if love.keyboard.wasPressed('space') then
            self.rolls = self.rolls + 1
                for k, die in pairs(self.dice) do
                    if die.reroll then
                        die.value = math.random(6)
                        die.reroll = false
                    end
                end
        end
        if love.keyboard.wasPressed('right') then
            self.selected = self.selected + 1
            if self.selected > 5 then
                self.selected = 5
            end
        end
        if love.keyboard.wasPressed('left') then
            self.selected = self.selected - 1
            if self.selected < 1 then
                self.selected = 1
            end
        end

        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            if not self.dice[self.selected].reroll then
                self.dice[self.selected].reroll = true
            else
                self.dice[self.selected].reroll = false
            end
        end
    end


end

function PlayState:render()
    local x = -70
    for k, die in pairs(self.dice) do 
        die:render(x)
        x = x + 30
    end

    x = self.position - 15
    local factor = self.selected * 15

    love.graphics.setColor(1, 1, 1, 128/255)
    love.graphics.rectangle('fill', x + factor, 142, 17, 17, 8)

end