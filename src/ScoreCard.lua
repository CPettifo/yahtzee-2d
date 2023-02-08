ScoreCard = Class{}

function ScoreCard:init()
    self.isFull = false

    self.score = {}
    for i = 1, 13 do
        table.insert(self.score, 0)
    end

    self.upperSum = 0
    self.lowerSum = 0
    self.total = 0
    self.firstYahtzee = false   
    
end

function ScoreCard:add(row, score)
    self.score[row] = self.score[row] + score
end
