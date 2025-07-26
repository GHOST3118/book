local base_util = require "base:util"
local PLAYER_INV = 0
local TARGET_SLOT = 0
local DROP_FORCE = 8
local DROP_INIT_VEL = {0, 3, 0}

function on_open(inv, slot)
    PLAYER_INV = inv
    TARGET_SLOT = slot
    document.writer_text.text = ""
    document.writer_title.text = ""

    if inventory.has_data(PLAYER_INV, TARGET_SLOT, "content") then
        local content = inventory.get_data(PLAYER_INV, TARGET_SLOT, "content")
        local caption = inventory.get_caption(PLAYER_INV, TARGET_SLOT)

        document.writer_text.text = content or ""
        document.writer_title.text = caption or ""
    end
end

function sign()
    inventory.set_data(PLAYER_INV, TARGET_SLOT, "signed", true)
    menu:reset()
    hud.close_inventory()
end

local function build_description(content)
    local is_signed = inventory.get_data(PLAYER_INV, TARGET_SLOT, "signed")

    local total_chars = "Total size: [#55ff55]" .. string.len(content)
    local signed = ""

    if is_signed then signed = "[#55ff55]signed[#ffffff]" end

    return "" .. total_chars .. "\n" .. signed .. ""
end

function on_close(invid)
    local content = document.writer_text.text or ""
    local caption = document.writer_title.text

    inventory.set_data(PLAYER_INV, TARGET_SLOT, "content", content)
    inventory.set_caption(PLAYER_INV, TARGET_SLOT, caption or "Untitled")
    inventory.set_description(PLAYER_INV, TARGET_SLOT, build_description(content))
end
