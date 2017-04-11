Element = {
	water = "A",
	ship = "N"
}

Square = {
	element = Element.water,
	isKnown = false
}

function Square:new()
	o = {}
   setmetatable(o, self)
   self.__index = self
   self.element = Element.water
   self.isKnown = false
   return o
end