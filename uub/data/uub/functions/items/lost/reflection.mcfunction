execute unless data entity @s Inventory[{id:"minecraft:stone_sword"}] run give @s stone_sword{Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:3s},{id:"minecraft:sharpness",lvl:2}]}
execute unless data entity @s Inventory[{id:"minecraft:firework_rocket"}] if data entity @s Inventory[{Slot:-106b}] run give @s firework_rocket{Fireworks:{Flight:3b,Explosions:[{Type:1,Flicker:1b,Trail:1b,Colors:[I;16777215]},{Type:0,Colors:[I;16777215]},{Type:4,Colors:[I;16777215]}]}}
execute unless data entity @s Inventory[{id:"minecraft:firework_rocket"}] unless data entity @s Inventory[{Slot:-106b}] run replaceitem entity @s weapon.offhand firework_rocket{Fireworks:{Flight:3b,Explosions:[{Type:0b,Colors:[I;16777215]}]}}
execute unless data entity @s Inventory[{id:"minecraft:crossbow"}] run give @s crossbow{Unbreakable:1b,Enchantments:[{id:"minecraft:piercing",lvl:4s},{id:"minecraft:quick_charge",lvl:2s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.05,Operation:0,UUID:[I;-1122294306,-247773886,-1511832433,709436595],Slot:"mainhand"}]}
