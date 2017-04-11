require "Game"

print("\nQue comece a batalha naval!")
print("Você pode sair a qualquer momento digitando S\n")

local boardSize = 4

local function getInformationFromUser(varName)
	invalidResponse = true
	while invalidResponse do
		print(varName..":")
		response = io.read()
		if response == "S" then
			print("Até logo!\n")
			os.exit()
		end
		response = tonumber(response)
		if response == nil then
			invalidResponse = true
			print("Digite um número")
		elseif response < 1 or response > boardSize then
			invalidResponse = true
			print("A "..varName.." deve estar entre 1 e 4")
		else
			invalidResponse = false
		end
	end
	return response
end

local game = Game:new(boardSize,boardSize)
game:initializeBoard()

while true do
	line = getInformationFromUser("linha")
	column = getInformationFromUser("coluna")
	game:shootAt(line,column)
	game:showBoard()
end
