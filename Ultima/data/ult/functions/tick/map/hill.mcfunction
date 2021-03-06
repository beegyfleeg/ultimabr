# Players on the black glass have fallen off
    execute as @a[tag=player, tag=alive, scores={altitude=19}, nbt={OnGround: true}] run function ult:tick/map/hill/felloff

# Phase change test
    # Countdown
    execute if predicate ult:coin_flip run scoreboard players remove .map event 1
    # Beatdown phase test (only if player is ready to be king)
    execute if score .map event matches ..0 if score .phase event matches 1 at @a[tag=player, tag=alive, nbt={OnGround: true}] if block ~ ~-1 ~ red_stained_glass run function ult:tick/map/hill/phase/beatdown
    # Capture phase test
    execute if score .map event matches ..0 if score .phase event matches 2 run function ult:tick/map/hill/phase/capture

# Phase notification
    execute if score .phase event matches 1 run title @a[tag=player, tag=alive] actionbar {"text": "Fight for the center!", "color": "aqua"}
    execute if score .phase event matches 2 run title @a[tag=hill_king, tag=player, tag=alive] actionbar {"text": "Shoot your opponents!", "color": "green"}
    execute if score .phase event matches 2 run title @a[tag=!hill_king, tag=player, tag=alive] actionbar {"text": "Run from the King!", "color": "red"}
