# Find player at this point in queue
    function ult:data/root
    execute as @a[tag=player, tag=!alive] if score @s queue = .iter _var run tag @s add root

# Search for player next in queue
    scoreboard players operation .queue _var = .iter _var
    scoreboard players remove .queue _var 1
    scoreboard players set .can_deplete _var 1
    execute as @a[tag=player, tag=!alive] if score @s queue = .queue _var run scoreboard players set .can_deplete _var 0

# If no such player exists, move up in the queue
    execute if score .can_deplete _var matches 1 run scoreboard players remove @a[tag=root] queue 1

# Keep looping if possible
    scoreboard players add .iter _var 1
    execute if score .iter _var <= .total_players control run function ult:spawn/queue_advance/loop
