scoreboard players set #verify _var 1
function uub:settings/ender_chest/hotbar/clear_unused_slots
execute unless data entity @s EnderItems[{id:"minecraft:golden_sword"}] run scoreboard players set #verify _var 0
execute unless data entity @s EnderItems[{id:"minecraft:crossbow"}] run scoreboard players set #verify _var 0
execute unless data entity @s EnderItems[{id:"minecraft:golden_sword"}] run scoreboard players set #verify _var 0
execute unless data entity @s EnderItems[{id:"minecraft:shield"}] run scoreboard players set #verify _var 0
execute unless data entity @s EnderItems[{id:"minecraft:arrow"}] run scoreboard players set #verify _var 0
execute unless data entity @s EnderItems[{id:"minecraft:ender_pearl"}] run scoreboard players set #verify _var 0

execute if score #verify _var matches 0 at @s run playsound entity.villager.no master @s
execute if score #verify _var matches 0 run tellraw @s [{"text": "Hotbar >> ","color": "dark_red","bold": true},{"text": "Please make sure each item is in a slot!","bold": false}]
execute if score #verify _var matches 1 run function uub:settings/ender_chest/hotbar/assign/citadel

execute if score #verify _var matches 0 run function uub:settings/ender_chest/hotbar
execute if score #verify _var matches 1 run function uub:settings/ender_chest/main