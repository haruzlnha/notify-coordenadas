local coordenadas = {
	{ vector3(302.12, -2735.77, 6.04) }, --triade
	{ vector3(1876.2, 471.62, 171.56) }, --penha
	{ vector3(2303.81, 201.59, 204.86) }, --tcp
	{ vector3(2695.76, -805.6, 28.95) }, --sindicato
	{ vector3(354.91, 301.51, 103.76) }, --gde
	{ vector3(-1489.95, 252.22, 61.81) }, --cv
	{ vector3(-1796.63, 476.18, 133.85) }, --b13
	{ vector3(-2558.83, 1913.78, 168.87) }, --frança
	{ vector3(-2648.63, 1307.69, 146.36) }, --italia
	{ vector3(-1478.84, 885.14, 182.84) }, --japonesa
	{ vector3(2536.99, 1893.38, 20.83) }, --diamonds
	{ vector3(-719.27, 2268.76, 77.59) } --motoclube
}
local primeiroaviso = false
local segundoaviso = false
Citizen.CreateThread(function()
	local player = source
	local ped = GetPlayerPed(player)
	while true do
		local playerCoords = GetEntityCoords(PlayerPedId())
		for i = 1, #coordenadas do
			local distancia = #(playerCoords - coordenadas[i][1])
			if distancia < 30 and not primeiroaviso then
				TriggerEvent("Notify", "negado", "CUIDADO! Você está próximo de uma área vermelha", 8000)
				primeiroaviso = true
			elseif distancia < 6 and not segundoaviso and primeiroaviso then
				TriggerEvent("Notify", "negado", "CUIDADO! Você entrou em uma área vermelha", 8000)
				segundoaviso = true
			end
		end
		Citizen.Wait(500)
	end




end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(15000) --regular o tempo de mostrar de novo em milisegundos
		if primeiroaviso then
			primeiroaviso = false
		elseif segundoaviso then
			segundoaviso = false
		end
	end


end)