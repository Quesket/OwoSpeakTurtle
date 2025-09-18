local owos = { 
    "OwO", "owo", "UwU", "uwu", "^w^", "(´•ω•)"
}

local function tlength(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

local string_gsub = string.gsub
local makeowo = SendChatMessage

function SendChatMessage(msg, chatType, language, channel, target)
    local owo = owos[random(tlength(owos))]
    local whatsthis = random(10)

    local s = msg
    s = string_gsub(s, "[LR]", "W")
    s = string_gsub(s, "[lr]", "w")
    s = string_gsub(s, "ith", "if")

    if whatsthis <= 7 then
        s = string_gsub(s, " ([fps])([aeiou])", " %1w%2")
    end

    if whatsthis <= 5 then
        s = string_gsub(s, " n([aeiou])", " ny%1")
    end

    if whatsthis <= 3 then
        s = string_gsub(s, " th", " d")
    end

    if whatsthis == 1 then
        s = s .. " " .. owo
    else
        s = string_gsub(s, "!$", " " .. owo)
    end

    return makeowo(s, chatType, language, channel, target)
end
