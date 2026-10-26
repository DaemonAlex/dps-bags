-- Shows my worn bag. My game creates the bag as a networked object stuck to my own ped, so
-- everyone near me sees it and it comes and goes with me. Event driven, no loops.

local inv = exports.ox_inventory
local worn = { back = { name = false, obj = nil }, hand = { name = false, obj = nil } }

local function drop(where)
    local w = worn[where]
    if w.obj and DoesEntityExist(w.obj) then DeleteEntity(w.obj) end
    w.obj, w.name = nil, false
end

local function wear(where, name, def)
    drop(where)
    if not name or not def then return end
    local ped = cache.ped
    if not lib.requestModel(def.model, 5000) then return end
    local c = GetEntityCoords(ped)
    local obj = CreateObject(joaat(def.model), c.x, c.y, c.z, true, true, false)
    SetModelAsNoLongerNeeded(joaat(def.model))
    SetEntityCollision(obj, false, false)
    AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, def.bone), def.pos.x, def.pos.y, def.pos.z,
        def.rot.x, def.rot.y, def.rot.z, true, true, false, true, 1, true)
    worn[where].obj, worn[where].name = obj, name
end

-- The bag of each kind in my lowest slot is the one I wear.
local function wanted()
    local back, backSlot, hand, handSlot
    for slot, item in pairs(inv:GetPlayerItems() or {}) do
        if Bags.Back[item.name] and (not backSlot or slot < backSlot) then back, backSlot = item.name, slot end
        if Bags.Hand[item.name] and (not handSlot or slot < handSlot) then hand, handSlot = item.name, slot end
    end
    return back or false, hand or false
end

-- Change needed when a different bag is wanted, or the wanted one is no longer in the world.
local function stale(w, name)
    return name ~= w.name or (name and not (w.obj and DoesEntityExist(w.obj)))
end

local function refresh(force)
    local back, hand = wanted()
    local changed = false
    if force or stale(worn.back, back) then
        wear('back', back, back and Bags.Back[back]); changed = true
    end
    if force or stale(worn.hand, hand) then
        wear('hand', hand, hand and Bags.Hand[hand]); changed = true
    end
    if changed then
        -- the server deletes these if I disconnect
        LocalPlayer.state:set(Bags.StateKey, {
            back = worn.back.obj and NetworkGetNetworkIdFromEntity(worn.back.obj) or false,
            hand = worn.hand.obj and NetworkGetNetworkIdFromEntity(worn.hand.obj) or false,
        }, true)
    end
end

AddEventHandler('ox_inventory:updateInventory', function() refresh(false) end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() SetTimeout(2000, function() refresh(true) end) end)
AddEventHandler('onClientResourceStart', function(res)
    if res == GetCurrentResourceName() then SetTimeout(2000, function() refresh(true) end) end
end)

-- A new ped (respawn, clothing change) needs the bag stuck on again.
lib.onCache('ped', function() SetTimeout(500, function() refresh(true) end) end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function() drop('back') drop('hand') end)

AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then drop('back') drop('hand') end
end)
