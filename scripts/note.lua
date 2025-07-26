local use = function (pid)
    local invid, slot = player.get_inventory(pid)

    local is_note_signed = inventory.get_data(invid, slot, "signed")

    if is_note_signed then
        hud.show_overlay("book:reader", false, {invid, slot})
    else
        hud.show_overlay("book:writer", false, {invid, slot})
    end
end

function on_use(pid)
    use(pid)
end

function on_use_on_block(x, y, z, pid, normal)
    use(pid)
end