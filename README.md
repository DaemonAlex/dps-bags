# dps-bags

Real bags for ox_inventory. A bag you carry shows on your character, and you can only use one at
a time.

## What it is for

In stock ox_inventory a backpack is an invisible box. Nobody can see you have one, and you can
carry five and open them all. This makes a bag a thing in the world: it sits on your back or in
your hand, other players can see it, and a second bag stays packed until the first comes off.

## What it does

- **Shows the bag.** A backpack or paramedic bag is worn on the back. A briefcase is carried in
  the right hand. Everyone nearby sees it.
- **One bag at a time.** Only the bag in your lowest inventory slot opens. A second one of the
  same kind can be carried, but not opened.
- **Cleans up.** A player who disconnects does not leave a bag floating behind.

Sizes and limits are not set here. They belong to the inventory (`data/items.lua` and
`modules/items/containers.lua`). `config.lua` only says how each bag is worn: the model, the bone
and the offsets.

## On its own, and with other scripts

**With stock ox_inventory.** Everything above. Bags are ox_inventory containers.

**With [dps-inventory](https://github.com/DaemonAlex/dps-inventory).** That inventory has its own
worn backpack slot and bag panel. The two work together: dps-inventory handles the slot and the
contents, dps-bags shows the bag on the character. Set `setr inventory:utilityclothing {}` so the
inventory does not also change the character's clothing, or you get two bags on one back. The
one-at-a-time rule here applies to bags that are still containers (the briefcase and paramedic
bag on DelPerroSands). Worn backpacks are limited by the single backpack slot instead.

**With a paid ambulance script.** The paramedic bag is whitelisted to medical items in the
inventory, so a medic's bag is visibly a medic's bag and holds only what a medic carries.

## Requirements

- `ox_lib`
- `ox_inventory`, or dps-inventory

## Install

1. Put the folder in your resources and add `ensure dps-bags` after `ox_inventory`.
2. Make sure the bag items named in `config.lua` exist in your inventory's `data/items.lua`.
3. Adjust the offsets in `config.lua` to suit your character models, then restart `dps-bags`.

## Configuration

`config.lua`:

| Setting | Meaning |
|---|---|
| `Bags.Back` | Bags worn on the back. Item name, prop model, bone, position, rotation. |
| `Bags.Hand` | Bags carried in the right hand. Same fields. |
| `Bags.StateKey` | The player statebag name used to track the spawned props. |

## Other DPS scripts

All of these are made for DelPerroSands and run together on one Qbox server. Each one works on
its own. The ones marked "pairs with" do more when both are running.

| Script | What it does |
|---|---|
| [dps-inventory](https://github.com/DaemonAlex/dps-inventory) | The inventory: ox_inventory with equipment slots, backpacks, armour plates and a self status panel, in the DelPerroSands colours. |
| [dps-medical](https://github.com/DaemonAlex/dps-medical) | Patient records, illness and diagnostic tests. A companion to wasabi_ambulance. Pairs with dps-inventory: symptoms and diagnoses show on the status panel. |
| [dps-insurance](https://github.com/DaemonAlex/dps-insurance) | Ties m-Insurance into the MDT, impound, hospital and medical chart. Pairs with dps-medical. |
| [dps-studio](https://github.com/DaemonAlex/dps-studio) | Build rooms, doors and portals in game from one panel (`/studio`), with owners and managers so staff do not have to support them. |
| [dps-shops](https://github.com/DaemonAlex/dps-shops) | Shop clerks who greet and react to a robbery, then player-owned shops. |
| [dps-fleet](https://github.com/DaemonAlex/dps-fleet) | Vehicle browser and workshop on one panel: extras, liveries and mods for emergency vehicles. |
| [dps-parking](https://github.com/DaemonAlex/dps-parking) | Parking with valet, impound, violations and reserved spots. |
| [dps-vehiclepersistence](https://github.com/DaemonAlex/dps-vehiclepersistence) | Vehicles stay where they were parked. Pairs with dps-parking. |
| [dps-towjob](https://github.com/DaemonAlex/dps-towjob) | Queue-based tow job with jg-mechanic integration. |
| [dps-services](https://github.com/DaemonAlex/dps-services) | Request a tow and follow it live on the lb-phone and lb-tablet. Pairs with dps-towjob. |
| [dps-autoshops](https://github.com/DaemonAlex/dps-autoshops) | Self-service repair shops when no mechanic is on duty. |
| [dps-cityworker](https://github.com/DaemonAlex/dps-cityworker) | City infrastructure job and career. |
| [dps-ainpcs](https://github.com/DaemonAlex/dps-ainpcs) | NPCs you can talk to, with trust, quests and intel. |
| [dps-badpeds](https://github.com/DaemonAlex/dps-badpeds) | Police interaction with NPCs: stops, arrests, intel and jail records. |
| [dps-gangwars](https://github.com/DaemonAlex/dps-gangwars) | Ambient gang NPCs, territory population and war reinforcements. |
| [dps-rotations](https://github.com/DaemonAlex/dps-rotations) | Moves dealers, harvests and other spots on a fixed schedule. |
| [dps-trains](https://github.com/DaemonAlex/dps-trains) | The train system. Pairs with dps-trains-stock, dps-traintools and dps-transitapp. |
| [dps-transitapp](https://github.com/DaemonAlex/dps-transitapp) | Live train arrival boards on the lb-phone. |
| [dps-faceplant](https://github.com/DaemonAlex/dps-faceplant) | City help, reports and staff tools on the lb-phone and lb-tablet. |
| [dps-chat](https://github.com/DaemonAlex/dps-chat) | A command box for voice-only servers. No chat feed. |
| [dps-filmmode](https://github.com/DaemonAlex/dps-filmmode) | One key hides every HUD layer and gives a smooth free camera for recording. |
