local PLAYER_INV = 0
local TARGET_SLOT = 0

function on_open(inv, slot)
    PLAYER_INV = inv
    TARGET_SLOT = slot
    document.reader_text.text = ""

    if inventory.has_data(PLAYER_INV, TARGET_SLOT, "content") then
        local content = inventory.get_data(PLAYER_INV, TARGET_SLOT, "content")

        document.reader_text.text = content or ""
    end
end