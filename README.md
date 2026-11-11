# TwoLineChat

**Every chat message is shown on two lines:** the header (time, channel, sender) on the first line and the message text on the second. Busy chat becomes much easier to read, because the text always starts on its own line.

*Русское описание ниже.*

```
[14:05] [2. Trade] [Thrall]:
Selling ore, whisper me

[14:06] [Guild] [Jaina]:
Anyone for a dungeon?
```

## Features

- **Two lines per message.** The first line is the header exactly as the game builds it (time, channel, player name). The second line is only the message text.
- **Blank line after every message.** Messages are separated from each other and do not blend together.
- **Works in all public and group chats.** Say, Yell, numbered channels (General, Trade, LFG and custom channels), Guild, Officer, Party, Raid, raid warnings and Instance chat, including messages from party, raid and instance leaders.
- **Everything else stays as it is.** Whispers, Battle.net messages, emotes, system messages, loot, experience, reputation and other non-chat lines keep the standard look.
- **Friendly to other chat addons.** Icons and notes that other addons put in front of the message text (for example PugaWhoIsTalking icons or CharacterNotes notes) stay on the first line next to the name. Only the real message text moves to the second line.
- **The header keeps working.** The game builds the header itself, so the timestamp, the channel name and the player name look and behave as usual. Links inside the message (items, quests and so on) are not changed either.
- **Careful with special cases.** Messages that already contain a line break are left untouched. Messages protected by the game during chat lockdown (boss fights, Mythic+, PvP) stay in the standard look.
- Works together with [ClickToReply](https://github.com/Ahri-ninetailed/ClickToReply): click the message text on the second line to answer the player.
- **Lightweight and safe.** Uses only the standard chat message filter. No Blizzard functions are overridden, nothing is hooked, and the header is not parsed.

## How to use

Install it and it works: all new messages in the supported chats are shown on two lines.

No settings window and no slash commands. The only option is the blank line after each message: to turn it off, open `TwoLineChat.lua` in the addon folder with a text editor, change `local BLANK_LINE_AFTER = true` to `false` and reload the interface (`/reload`). An addon update restores the file, so the change has to be made again after updating.

## Installation

Install it with the CurseForge app, or download the archive from [GitHub Releases](https://github.com/Ahri-ninetailed/TwoLineChat/releases) and unpack the `TwoLineChat` folder into `World of Warcraft\_forever_\Interface\AddOns`.

Game version: **WoW Forever**.

Source code and bug reports: [GitHub](https://github.com/Ahri-ninetailed/TwoLineChat)

---

# TwoLineChat (Русский)

**Каждое сообщение чата показывается в две строки:** заголовок (время, канал, ник) на первой строке и текст сообщения на второй. Оживлённый чат читать намного легче, потому что текст всегда начинается с новой строки.

```
[14:05] [2. Торговля] [Тралл]:
Продам руду, пишите в личку

[14:06] [Гильдия] [Джайна]:
Кто в подземелье?
```

## Возможности

- **Две строки на сообщение.** Первая строка: заголовок ровно в том виде, в каком его строит игра (время, канал, ник). Вторая строка: только текст сообщения.
- **Пустая строка после каждого сообщения.** Сообщения отделены друг от друга и не сливаются.
- **Работает во всех общих и групповых чатах.** «Сказать», «Крик», номерные каналы (Общий, Торговля, Поиск спутников и пользовательские каналы), гильдия, офицерский, группа, рейд, объявления рейда и подземелье, включая сообщения лидеров группы, рейда и подземелья.
- **Всё остальное остаётся как было.** Шёпот, сообщения Battle.net, эмоции, системные сообщения, добыча, опыт, репутация и прочее выглядят стандартно.
- **Дружит с другими аддонами для чата.** Иконки и пометки, которые другие аддоны ставят перед текстом сообщения (например, иконки PugaWhoIsTalking или заметки CharacterNotes), остаются на первой строке рядом с ником. На вторую строку уходит только настоящий текст сообщения.
- **Заголовок работает как раньше.** Заголовок строит сама игра, поэтому время, название канала и ник выглядят и работают как обычно. Ссылки внутри сообщения (предметы, задания и так далее) тоже не меняются.
- **Аккуратен с особыми случаями.** Сообщения, в которых уже есть перевод строки, аддон не трогает. Сообщения, которые игра защищает во время блокировки чата (бои с боссами, эпохальные+ подземелья, ПвП), остаются в стандартном виде.
- Работает вместе с [ClickToReply](https://github.com/Ahri-ninetailed/ClickToReply): щёлкните по тексту сообщения на второй строке, чтобы ответить игроку.
- **Лёгкий и безопасный.** Использует только стандартный фильтр сообщений чата. Не переопределяет функции Blizzard, ничего не перехватывает и не разбирает заголовок.

## Как пользоваться

Установил, и всё работает: все новые сообщения в поддерживаемых чатах показываются в две строки.

Окна настроек и команд нет. Единственная настройка: пустая строка после каждого сообщения. Чтобы её отключить, откройте `TwoLineChat.lua` в папке аддона текстовым редактором, замените `local BLANK_LINE_AFTER = true` на `false` и перезагрузите интерфейс (`/reload`). Обновление аддона возвращает файл в исходный вид, поэтому после обновления правку нужно сделать заново.

## Установка

Через приложение CurseForge или скачайте архив из [GitHub Releases](https://github.com/Ahri-ninetailed/TwoLineChat/releases) и распакуйте папку `TwoLineChat` в `World of Warcraft\_forever_\Interface\AddOns`.

Версия игры: **WoW Forever**.

Исходный код и сообщения об ошибках: [GitHub](https://github.com/Ahri-ninetailed/TwoLineChat)
