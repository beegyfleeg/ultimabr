# Consume coal
    clear @s coal

# Summon fireball (cannonball)
    tag @e remove temp_fireball
    summon fireball ^ ^ ^1 {Fire: -20s, Item: {Count: 1b, id: "coal"}, Tags: ["temp_fireball"]}
    scoreboard players operation @e[tag=temp_fireball] pn = @s pn

# Summon a tracker
    tag @e remove temp
    summon marker ^ ^ ^1 {Tags: ["fireball_tracker", "temp"]}
    scoreboard players operation @e[tag=temp] pn = @s pn

# Summon a trajectory marker
    tag @e remove temp
    summon marker ^ ^ ^50 {Tags: ["temp"]}

# Get trajectory marker position
    execute store result score .x _var run data get entity @e[limit=1, tag=temp] Pos[0] 1000000
    execute store result score .y _var run data get entity @e[limit=1, tag=temp] Pos[1] 1000000
    execute store result score .z _var run data get entity @e[limit=1, tag=temp] Pos[2] 1000000
    kill @e[tag=temp]

# Get fireball position
    execute store result score .x2 _var run data get entity @e[limit=1, tag=temp_fireball] Pos[0] 1000000
    execute store result score .y2 _var run data get entity @e[limit=1, tag=temp_fireball] Pos[1] 1000000
    execute store result score .z2 _var run data get entity @e[limit=1, tag=temp_fireball] Pos[2] 1000000

# Get trajectory
    scoreboard players operation .x _var -= .x2 _var
    scoreboard players operation .y _var -= .y2 _var
    scoreboard players operation .z _var -= .z2 _var

# Calculate motion
    data modify storage ult:temp Motion set value [0d, 0d, 0d]
    data modify storage ult:temp Power set value [0d, 0d, 0d]
    # Motion
    execute store result storage ult:temp Motion[0] double 0.00000002 run scoreboard players get .x _var
    execute store result storage ult:temp Motion[1] double 0.00000002 run scoreboard players get .y _var
    execute store result storage ult:temp Motion[2] double 0.00000002 run scoreboard players get .z _var
    # Acceleration
    execute store result storage ult:temp Power[0] double 0.00000001 run scoreboard players get .x _var
    execute store result storage ult:temp Power[1] double 0.00000001 run scoreboard players get .y _var
    execute store result storage ult:temp Power[2] double 0.00000001 run scoreboard players get .z _var

# Apply motion
    data modify entity @e[limit=1, tag=temp_fireball] Motion set from storage ult:temp Motion
    data modify entity @e[limit=1, tag=temp_fireball] power set from storage ult:temp Power
