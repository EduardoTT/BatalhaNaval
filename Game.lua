require "Square"

Game = { board = {}, numberOfLines = 0, numberOfColumns = 0 }

function Game:new(numberOfLines,numberOfColumns)
	o = {}
   setmetatable(o, self)
   self.__index = self
   self.board = {}
   self.numberOfLines = numberOfLines
   self.numberOfColumns = numberOfColumns
   return o
end

function Game:initializeBoard()
	math.randomseed( os.time() )
	element = { [1] = Element.water, [2] = Element.ship }
	for i=1,self.numberOfLines do
		self.board[i] = {}
		for j=1,self.numberOfColumns do
			randomNumber = math.random(2)
			self.board[i][j] = Square:new()
			self.board[i][j].element = element[randomNumber]
		end
	end
end

function Game:showBoard()
	for i = 1,self.numberOfLines do
		for j = 1,self.numberOfColumns do
			square = self.board[i][j]
			if square.isKnown then
				io.write(square.element.."  ")
			else 
				io.write("*  ")
			end
		end	
		print()
	end
	print()
end

function Game:shootAt(line,column)
	self.board[line][column].isKnown = true
end