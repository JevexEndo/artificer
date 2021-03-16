###################################################################################
#
# Author: ICY - Datapack Utilities
# Edited By: Jevex
# Description: Update boots durability
#
###################################################################################

#Indicate items have been modified and need to be restored
scoreboard players set $temp_7 dur.data 1

# Place boots into storage for data manipulation
data modify storage artificer_durability:temp object set from block -29999999 0 1601 Items[2]
execute positioned -29999999 0 1601 unless block ~ ~ ~ green_shulker_box{Items:[{Slot:2b,tag:{Durability:{Init:1b}}}]} run function artificer_durability:durability/handle/item_init
execute positioned -29999999 0 1601 if block ~ ~ ~ green_shulker_box{Items:[{Slot:2b,tag:{Durability:{Actual:0}}}]} run function artificer_durability:durability/handle/item_unbreakable
execute positioned -29999999 0 1601 unless block ~ ~ ~ green_shulker_box{Items:[{Slot:2b,tag:{Durability:{Actual:0}}}]} run function artificer_durability:durability/handle/item_durability
data modify block -29999999 0 1601 Items[2] set from storage artificer_durability:temp object

# Assign item lore
data merge block -29999999 0 1602 {Text1:'[{"translate":"item.durability","color":"#6B6B6B","italic":false,"with":[{"nbt":"Items[2].tag.Durability.Custom","block":"-29999999 0 1601","color":"#6B6B6B","italic":false},{"nbt":"Items[2].tag.Durability.CustomMax","block":"-29999999 0 1601","color":"#6B6B6B","italic":false}]}]'}
data modify block -29999999 0 1601 Items[2].tag.display.Lore[-1] set from block -29999999 0 1602 Text1

# Destroy item if broken
execute if score $out_0 dur.data matches 0 run replaceitem block -29999999 0 1601 container.2 minecraft:leather_boots{GUI:1b}
execute at @s if score $out_0 dur.data matches 0 run playsound minecraft:entity.item.break player @s