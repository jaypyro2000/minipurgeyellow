#Copyright JayPyro2000 2025. All Rights Reserved.

# Initiate a loot drop with values from minipurgeyellow:loot.
$summon marker $(yellow_loot_x_pos) $(yellow_loot_y_pos) $(yellow_loot_z_pos) {Tags:["yellow_loot_loc"]}
$schedule function minipurgeyellow:loot $(yellow_loot_time)s