local HttpService = game:GetService("HttpService")

local KEY = "ABC123" -- chave do comprador

local data = game:HttpGet(
    "https://raw.githubusercontent.com/SeuUsuario/SeuRepositorio/main/usuarios.json"
)

local users = HttpService:JSONDecode(data)

if not users[KEY] then
    warn("Chave inválida")
    return
end

print("Autorizado!")

-- Script principal
loadstring(game:HttpGet("https://raw.githubusercontent.com/Espectroxs/CLT-HUB/refs/heads/main/EspectralUnknown.lua"))()
