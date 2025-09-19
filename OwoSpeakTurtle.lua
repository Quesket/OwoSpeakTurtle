local owos = { 
    "OwO", "owo", "UwU", "uwu", "^w^", "(´•ω•)"
}

local function print(message) -- we use the "function" keyword, we give ouf func a name, and we pass a parameter as data to our func
    DEFAULT_CHAT_FRAME:AddMessage(message) -- the functions body will execute our ":AddMessage()" func with our parameter
end

local function tlength(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

local string_gsub = string.gsub
local makeowo = SendChatMessage
local owospeak_enabled = true
local owospeak_version = "1"

function SendChatMessage(msg, chatType, language, channel, target)
    if not owospeak_enabled then
        return makeowo(msg, chatType, language, channel, target)
    end

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

-- Slash command setup
SLASH_OWOSPEAK1 = "/owospeak"
SLASH_OWOSPEAK2 = "/owo"

SlashCmdList["OWOSPEAK"] = function(msg)
    msg = string.lower(msg or "")
    if msg == "" then
        local status = owospeak_enabled and "enabled" or "disabled"
        print("Owospeak v" .. owospeak_version .. " is " .. status)
    elseif msg == "enable" then
        if owospeak_enabled then
            print("Owospeak is already enabled")
        else
            owospeak_enabled = true
            print("Owospeak enabled")
        end
    elseif msg == "disable" then
        if not owospeak_enabled then
            print("Owospeak is already disabled")
        else
            owospeak_enabled = false
            print("Owospeak disabled")
        end
    else
        print("Usage: /owospeak [enable|disable]")
    end
end
