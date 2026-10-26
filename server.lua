-- One worn bag at a time: only the bag in the lowest inventory slot of its kind can be opened.
-- A second backpack can be carried, but it stays packed until the first one comes off.
-- (ox_inventory itself already refuses a bag inside a bag.)

local inv = exports.ox_inventory

local function lowestSlot(source, names)
    local best
    for name in pairs(names) do
        for _, item in pairs(inv:GetSlotsWithItem(source, name) or {}) do
            if not best or item.slot < best then best = item.slot end
        end
    end
    return best
end

local hand = {}
for name in pairs(Bags.Hand) do hand[name] = true end

inv:registerHook('openInventory', function(payload)
    if payload.inventoryType ~= 'container' or not payload.slot then return end
    local item = inv:GetSlot(payload.source, payload.slot)
    if not item then return end

    local kind = Bags.Back[item.name] and Bags.Back or (hand[item.name] and hand) or nil
    if not kind then return end

    local first = lowestSlot(payload.source, kind)
    if first and first ~= payload.slot then
        TriggerClientEvent('ox_lib:notify', payload.source, {
            type = 'error',
            description = 'You can only use one bag at a time. Take the other one off first.',
        })
        return false
    end
end, {})

-- A player who disconnects leaves no bag floating behind.
AddEventHandler('playerDropped', function()
    local ids = Player(source).state[Bags.StateKey]
    if type(ids) ~= 'table' then return end
    for _, netId in pairs(ids) do
        if netId then
            local obj = NetworkGetEntityFromNetworkId(netId)
            if obj ~= 0 and DoesEntityExist(obj) then DeleteEntity(obj) end
        end
    end
end)
