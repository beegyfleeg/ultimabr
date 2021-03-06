# Make a marker with this map value
    tag @e remove temp
    summon marker ~ ~ ~ {Tags: ["temp", "choose_map"]}
    scoreboard players operation @e[limit=1, tag=temp] control = .temp _var

# Increase the map value
    scoreboard players add .temp _var 1
    # Carry over if through all the defaults
    execute if score .temp _var > flag.end_default const unless score .temp _var > flag.start_featured const run scoreboard players operation .temp _var = flag.start_featured const
    # Assign the next map if not through all maps
    execute unless score .temp _var > flag.end_featured const run function ult:data/map/choose_map/marker_assign_map
