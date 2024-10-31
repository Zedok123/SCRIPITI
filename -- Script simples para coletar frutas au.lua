-- Script simples para coletar frutas automaticamente no Blox Fruits com opção de ativar/desativar

-- Variáveis de controle
local ativarColeta = true

-- Função para encontrar frutas próximas
function encontrarFrutas()
    for i, objeto in pairs(game.Workspace:GetChildren()) do
        if objeto:IsA("Tool") and objeto.Name == "Fruit" then
            return objeto
        end
    end
    return nil
end

-- Função para mover o jogador até a fruta
function moverParaFruta(fruta)
    local jogador = game.Players.LocalPlayer
    local personagem = jogador.Character or jogador.CharacterAdded:Wait()
    personagem:MoveTo(fruta.Position)
end

-- Loop principal
while true do
    if ativarColeta then
        local fruta = encontrarFrutas()
        if fruta then
            moverParaFruta(fruta)
        end
    end
    wait(1) -- Espera 1 segundo antes de procurar novamente
end

-- Função para ativar/desativar a coleta
function alternarColeta()
    ativarColeta = not ativarColeta
end

-- Exemplo de como alternar a coleta (pode ser ligado a um botão ou comando)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "!coleta" then
        alternarColeta()
    end
end)
