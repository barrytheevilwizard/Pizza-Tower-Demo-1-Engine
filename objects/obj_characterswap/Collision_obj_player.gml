if other.key_up2 && global.character == "P"
{
	global.character = "M"
	sprite_index = spr_pepperman
}
else if other.key_up2 && global.character == "M"
{
	global.character = "P"
	sprite_index = spr_player_idle 
}


