# Apply skill
    # Get skill value of nearest marker
    scoreboard players operation @s event.skill = @e[sort=nearest, limit=1, tag=last_stand_skill] event.skill
    # Announce application
    execute if score @s event.skill = event.skill.flurry_rush const run tellraw @a [{"selector": "@s", "color": "gray"}, {"text": " learned ", "color": "dark_gray"}, {"text": "Flurry Rush", "color": "dark_blue"}, {"text": ".", "color": "dark_gray"}]
    execute if score @s event.skill = event.skill.hot_pursuit const run tellraw @a [{"selector": "@s", "color": "gray"}, {"text": " learned ", "color": "dark_gray"}, {"text": "Hot Pursuit", "color": "dark_blue"}, {"text": ".", "color": "dark_gray"}]
    execute if score @s event.skill = event.skill.combonatrix const run tellraw @a [{"selector": "@s", "color": "gray"}, {"text": " learned ", "color": "dark_gray"}, {"text": "Combonatrix", "color": "dark_blue"}, {"text": ".", "color": "dark_gray"}]
    execute if score @s event.skill = event.skill.backstabbing const run tellraw @a [{"selector": "@s", "color": "gray"}, {"text": " learned ", "color": "dark_gray"}, {"text": "Backstabbing", "color": "dark_blue"}, {"text": ".", "color": "dark_gray"}]

# Reset attributes and apply new ones
    function ult:tick/map/last_stand/skill/reset
    execute if score @s event.skill = event.skill.hot_pursuit const run attribute @s generic.movement_speed base set 0.13
