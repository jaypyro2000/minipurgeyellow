execute at @e[tag=chest_loc,limit=1] run setblock ~2 ~2 ~2 minecraft:ancient_debris
execute at @e[tag=chest_loc,limit=1] run setblock ~2 ~2 ~-2 minecraft:ancient_debris
execute at @e[tag=chest_loc,limit=1] run setblock ~-2 ~2 ~2 minecraft:ancient_debris
execute at @e[tag=chest_loc,limit=1] run setblock ~-2 ~2 ~-2 minecraft:ancient_debris

scoreboard players set #yellow_loot_type variables 0
schedule function minipurgeyellow:loot 300s