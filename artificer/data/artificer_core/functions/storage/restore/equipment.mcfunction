###################################################################################
#
# Author: ICY - Datapack Utilities
# Description: Restore player equipment
#
###################################################################################

data remove block -29999999 0 1601 Items.[{tag:{GUI:1b}}]
loot replace entity @s weapon.mainhand mine -29999999 0 1601 minecraft:air{drop_contents:1b}