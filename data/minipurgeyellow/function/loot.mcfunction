#Copyright JayPyro2000 2025. All Rights Reserved.

# Deploy loot and guards when this function is called barring the first time.
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 1 run setblock ~ ~ ~ minecraft:iron_block
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 2 run setblock ~ ~ ~ minecraft:gold_block
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 3 run setblock ~ ~ ~ minecraft:iron_ore
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 3 run setblock ~1 ~ ~ minecraft:iron_ore
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 3 run setblock ~ ~ ~1 minecraft:iron_ore
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 3 run setblock ~ ~1 ~ minecraft:gold_ore
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 3 run setblock ~-1 ~ ~ minecraft:diamond_ore

execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 1.. run summon minecraft:zombie ~ ~1 ~ {PersistenceRequired:1,equipment:{mainhand:{count:1,id:iron_sword},head:{count:1,id:carved_pumpkin},chest:{count:1,id:chainmail_chestplate},legs:{count:1,id:chainmail_leggings},feet:{count:1,id:chainmail_boots}},CustomName:Guard}
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 1.. run summon minecraft:zombie ~ ~1 ~ {PersistenceRequired:1,equipment:{mainhand:{count:1,id:iron_sword},head:{count:1,id:carved_pumpkin},chest:{count:1,id:golden_chestplate},legs:{count:1,id:golden_leggings},feet:{count:1,id:golden_boots}},CustomName:Guard}
execute at @e[tag=yellow_loot_loc,limit=1] if score #yellow_loot_type variables matches 1.. run summon minecraft:skeleton ~ ~1 ~ {PersistenceRequired:1,equipment:{mainhand:{count:1,id:bow,components:{enchantments:{'power':1}}},head:{count:1,id:carved_pumpkin},chest:{count:1,id:iron_chestplate},legs:{count:1,id:iron_leggings},feet:{count:1,id:iron_boots}},CustomName:Guard}

# Remove the loot location.
tag @e[tag=yellow_loot_loc] remove yellow_loot_loc

# Initiate values for the next loot drop. Loot type, time to loot drop and relative position.
execute store result score #yellow_loot_type variables run random value 1..3
execute store result storage minipurgeyellow:variables yellow_loot_time int 1 run random value 300..1800
execute store result score #yellow_loot_x_pos variables run random value -20..20
execute store result score #yellow_loot_z_pos variables run random value -20..20

# Transfer that to absolute position and store it.
scoreboard players operation #yellow_loot_x_pos variables += #center_x_pos variables
scoreboard players operation #yellow_loot_z_pos variables += #center_z_pos variables
execute store result storage minipurgeyellow:variables yellow_loot_x_pos int 1 run scoreboard players get #yellow_loot_x_pos variables
execute store result storage minipurgeyellow:variables yellow_loot_z_pos int 1 run scoreboard players get #yellow_loot_z_pos variables

# Retrive the surface y.
execute store result storage minipurgeyellow:variables yellow_loot_y_pos int 1 run function mphelper:surface/surface_from_scoreboard {x_pos_score:"#yellow_loot_x_pos variables",z_pos_score:"#yellow_loot_z_pos variables"}

# Go around again.
execute run function minipurgeyellow:dispatcher with storage minipurgeyellow:variables