-- TwoLineChat: сообщение чата в две строки.
--   строка 1: заголовок Blizzard (время, канал, ник) + иконки/пометки других аддонов
--   строка 2: только текст сообщения
--
-- Используется только фильтр сообщений чата. Ничего не перехватывается и не заменяется,
-- заголовок не разбирается: перевод строки вставляется прямо в текст сообщения (arg1),
-- а заголовок клиент строит сам и ставит перед ним. Поэтому границу не нужно угадывать.

-- События, которые форматируем. Whisper, Battle.net, системные сообщения, добыча, опыт,
-- репутация и т.п. сюда намеренно не входят.
local EVENTS = {
    "CHAT_MSG_SAY",
    "CHAT_MSG_YELL",
    "CHAT_MSG_CHANNEL", -- General, Trade, LFG и пользовательские каналы
    "CHAT_MSG_GUILD",
    "CHAT_MSG_OFFICER",
    "CHAT_MSG_PARTY",
    "CHAT_MSG_PARTY_LEADER",
    "CHAT_MSG_RAID",
    "CHAT_MSG_RAID_LEADER",
    "CHAT_MSG_RAID_WARNING",
    "CHAT_MSG_INSTANCE_CHAT",
    "CHAT_MSG_INSTANCE_CHAT_LEADER",
}

-- Пустая строка после каждого сообщения. Поставьте false, чтобы отключить.
local BLANK_LINE_AFTER = true

local issecretvalue = issecretvalue or function() return false end
local GetChatLineText = C_ChatInfo and C_ChatInfo.GetChatLineText

-- Иконки в начале текста: "|A...|a" (атлас) и "|T...|t" (текстура).
-- Игрок такие коды отправить не может (клиент превращает "|" в "||"), значит,
-- они всегда добавлены аддоном, например PugaWhoIsTalking.
local function IconPrefixLength(text)
    local last = 0
    while true do
        local _, e = text:find("^|A[^|]*|a", last + 1)
        if not e then
            _, e = text:find("^|T[^|]*|t", last + 1)
        end
        if not e then
            break
        end
        last = e
    end
    if last > 0 and text:sub(last + 1, last + 1) == " " then
        last = last + 1
    end
    return last
end

-- Сколько символов в начале text добавили фильтры других аддонов (иконки Puga, заметки
-- CharacterNotes и т.д.). Остальное - настоящий текст сообщения.
local function PrefixLength(text, lineID)
    -- Точный способ: клиент хранит исходный текст строки чата. Если отфильтрованный
    -- текст всё ещё им заканчивается, всё, что стоит перед ним, добавлено аддонами.
    if GetChatLineText and type(lineID) == "number" then
        local ok, original = pcall(GetChatLineText, lineID)
        if ok and type(original) == "string" and not issecretvalue(original)
            and original ~= "" and #original <= #text and text:sub(-#original) == original then
            return #text - #original
        end
    end
    -- Запасной способ: другой фильтр изменил и сам текст (например, переписал ссылку).
    -- Тогда считаем префиксом только иконки в начале.
    return IconPrefixLength(text)
end

local function Filter(_, _, text, ...)
    -- Клиент не вызывает фильтры с секретными аргументами (chat lockdown: босс, M+, ПвП),
    -- но проверка дешёвая. Такие сообщения остаются в стандартном виде.
    -- Текст с уже имеющимся переводом строки не трогаем.
    if type(text) ~= "string" or issecretvalue(text) or text == "" or text:find("\n", 1, true) then
        return false
    end

    local cut = PrefixLength(text, (select(10, ...))) -- arg11 = lineID
    local result = text:sub(1, cut) .. "\n" .. text:sub(cut + 1)
    if BLANK_LINE_AFTER then
        result = result .. "\n "
    end

    return false, result, ...
end

-- В клиенте 12.x фильтры живут в ChatFrameUtil; ChatFrame_AddMessageEventFilter - лишь
-- устаревший алиас, который есть только при включённом CVar loadDeprecationFallbacks.
local addFilter = (ChatFrameUtil and ChatFrameUtil.AddMessageEventFilter) or ChatFrame_AddMessageEventFilter
if not addFilter then
    print("|cffff7f00TwoLineChat:|r API фильтров чата не найден, аддон не работает.")
    return
end

for _, event in ipairs(EVENTS) do
    addFilter(event, Filter)
end
