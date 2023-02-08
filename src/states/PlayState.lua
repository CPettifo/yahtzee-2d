PlayState = Class{__includes = BaseState}

function PlayState:init()

    self.canInput = true
    self.rolls = 0
    self.debug = false
    self.dice = {}
    for i = 1, 5 do
        table.insert(self.dice, Die())
        print(self.dice[i].value)
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
                    if not die.rerolls then
                        die.value = math.random(6)
                    end
                    print(die.value)
                end
        end
    end


end

function PlayState:render()
end