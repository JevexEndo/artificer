###################################################################################
#
# Author: Jevex
# Description: Generates Artificer Durability scoreboards and objectives
#
###################################################################################

# Create scoreboard objectives
scoreboard objectives add dur.data dummy

# Load storage default parameters
data merge storage artificer_durability:temp {list:[],object:{},var:0}