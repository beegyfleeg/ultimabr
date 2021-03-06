function ult:data/player/get_nbt

execute store result score .hotbar _var run data get storage ult:temp Player.Hotbar.marooned.sword
loot replace block 0 0 0 container.0 loot ult:map_items/marooned/sword
function ult:spawn/items/give

execute store result score .hotbar _var run data get storage ult:temp Player.Hotbar.marooned.trident
loot replace block 0 0 0 container.0 loot ult:map_items/marooned/trident
function ult:spawn/items/give

execute store result score .hotbar _var run data get storage ult:temp Player.Hotbar.marooned.crossbow
loot replace block 0 0 0 container.0 loot ult:map_items/marooned/crossbow
function ult:spawn/items/give

execute store result score .hotbar _var run data get storage ult:temp Player.Hotbar.marooned.heart
loot replace block 0 0 0 container.0 loot ult:map_items/marooned/heart
function ult:spawn/items/give

item replace entity @s armor.feet with iron_boots{Unbreakable: true, Enchantments: [{id: "minecraft:protection", lvl: 1s}]}
item replace entity @s armor.legs with iron_leggings{Unbreakable: true, Enchantments: [{id: "minecraft:protection", lvl: 1s}]}
item replace entity @s armor.chest with iron_chestplate{Unbreakable: true, Enchantments: [{id: "minecraft:protection", lvl: 1s}]}
item replace entity @s armor.head with iron_helmet{Unbreakable: true, Enchantments: [{id: "minecraft:protection", lvl: 1s}]}

function ult:spawn/items/refills/marooned

effect give @s night_vision 99999 0 true
