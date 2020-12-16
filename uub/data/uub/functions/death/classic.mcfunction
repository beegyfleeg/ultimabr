tag @a remove killtag
tag @r[scores={qkill=1..}] add killtag
scoreboard players remove @a[tag=killtag] qkill 1

tellraw @a ""

tag @a remove player
tag @s[tag=!alive] add player
tag @a remove random
tag @r[tag=alive,tag=!killtag] add random

execute at @a[tag=killtag] run particle totem_of_undying ~ ~1 ~ 0 0 0 0.7 50
execute as @a[tag=killtag] at @s[tag=!alive] run playsound entity.player.levelup master @s[tag=!alive]

execute if entity @e[tag=killtag,scores={qdeath=1..}] run function uub:death/simul
execute unless entity @e[tag=killtag,scores={qdeath=1..}] run function uub:death/msg

scoreboard players set @s[tag=!alive] tether 0
scoreboard players operation @s[tag=!alive] tether = @r[tag=killtag] pn
scoreboard players add @r[tag=killtag] kills 1
execute if score @s[tag=!alive] tether matches 0 run scoreboard players add @r[tag=random] kills 1
execute if score @s[tag=!alive] tether matches 0 run scoreboard players operation @s[tag=!alive] tether = @r[tag=random] pn
execute if score @s[tag=!alive] tether matches 0 run function uub:respawn

tag @a remove player
tag @s[tag=!alive] add player
tag @a remove respawn
tag @a remove respawn_one
execute as @a[team=play,tag=!alive] if score @s[tag=!alive] tether = @r[tag=player] pn run tag @s add respawn
tag @r[tag=respawn] add respawn_one
execute as @a[tag=respawn] run function uub:respawn
tag @a[tag=respawn_one] remove respawn
execute if entity @a[tag=respawn_one] unless entity @a[tag=respawn] run tellraw @a [{"selector": "@a[tag=respawn_one]"},{"text": " respawned.","color": "gray"}]
execute if entity @a[tag=respawn] run tellraw @a [{"selector": "@a[tag=respawn]"},{"text": " and ","color": "gray"},{"selector": "@a[tag=respawn_one]"},{"text": " respawned.","color": "gray"}]

scoreboard players set alive n 0
execute as @a[tag=alive] run scoreboard players add alive n 1
execute if score alive n matches 1 run tellraw @a [{"selector": "@a[tag=alive]"},{"text": " wins!","color": "gray"}]
execute if score alive n matches 1 as @a[tag=alive] run function uub:victory
tellraw @a[team=play] [{"text": "If you need to leave or take a break, ","color": "gold"},{"text": "opt out.","color": "yellow","underlined": true,"clickEvent": {"action": "run_command","value": "/trigger action set 5"}}]
tellraw @a[team=spect] [{"text": "Want to join the fun? ","color": "green"},{"text": "Opt in.","color": "yellow","underlined": true,"clickEvent": {"action": "run_command","value": "/trigger action set 6"}}]
