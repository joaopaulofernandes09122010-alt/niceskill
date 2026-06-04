local HttpService = game:GetService("HttpService")

local WEBHOOK = "https://discord.com/api/webhooks/1512185960463597688/8gQmajWVdR7T-5BkXK8SMBME1-RMoPAieYlAdQvY0UXQbBTbVvpJu_lwxtrS30Uu49v7"
local AUTORIZADOS = "https://raw.githubusercontent.com/joaopaulofernandes09122010-alt/niceskill/refs/heads/main/usuarios.json"

local function GetHWID()
    if gethwid then
        return gethwid()
    end

    return "HWID_INDISPONIVEL"
end

local HWID = GetHWID()

local ok, data = pcall(function()
    return game:HttpGet(AUTORIZADOS)
end)

if ok then
    local lista = HttpService:JSONDecode(data)

    if lista[HWID] then
        print("Autorizado!")

        loadstring(game:HttpGet("https://raw.githubusercontent.com/Espectroxs/CLT-HUB/refs/heads/main/EspectralUnknown.lua"))()

        return
    end
end

local payload = {
    content = string.format(
        "Novo pedido de acesso\nHWID: `%s`",
        HWID
    )
}

request({
    Url = WEBHOOK,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(payload)
})

warn("Seu HWID foi enviado para aprovação. Aguarde autorização.")
