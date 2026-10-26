-- DelPerroSands bags (2026-10-19, Damon). Sizes and limits live in ox_inventory
-- (data/items.lua and modules/items/containers.lua); this file only says how each bag is worn.
-- Offsets are a first guess: tune them here after the in-game look, then restart dps-bags.

Bags = {}

-- Bags worn on the back. Only one is worn: the one in the lowest inventory slot.
Bags.Back = {
    backpack     = { model = 'p_michael_backpack_s',    bone = 24818, pos = vec3(0.07, -0.11, -0.05), rot = vec3(0.0, 90.0, 175.0) },
    backpack2    = { model = 'sf_prop_sf_backpack_01a', bone = 24818, pos = vec3(0.07, -0.11, -0.05), rot = vec3(0.0, 90.0, 175.0) },
    paramedicbag = { model = 'xm_prop_x17_bag_med_01a', bone = 24818, pos = vec3(-0.10, -0.18, 0.0), rot = vec3(0.0, 90.0, 180.0) },
}

-- Carried in the right hand while it is in your pockets (Damon: "in hand").
Bags.Hand = {
    briefcase = { model = 'm24_2_prop_m42_metalbriefcase_01a', bone = 57005, pos = vec3(0.10, 0.0, 0.0), rot = vec3(0.0, 280.0, 53.0) },
}

Bags.StateKey = 'dpsBags'
