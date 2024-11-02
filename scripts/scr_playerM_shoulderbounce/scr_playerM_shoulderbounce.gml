// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerM_shoulderbounce()
{
	image_speed = 0.5
	hsp = (xscale * movespeed);
	momemtum = 1;
	move = (key_right + key_left);
	if move == 1 * xscale 
	movespeed = Approach(movespeed,8,1)
	else if move == -1 * xscale 
	movespeed = Approach(movespeed,-4,1.5)
	if move == 0
	movespeed = Approach(movespeed,0,0.75)
	if grounded && vsp > 0
	{
	    state = 0
		sprite_index = spr_player_land 
		image_index = 0
		if movespeed < 0
		movespeed *= -1
		if move != 0
		xscale = move
	}
	if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_Sjumpcancelstart))
	{
		sprite_index = spr_playerM_shoulderbash
		state = 82
		movespeed = 13
		vsp = -11
		flash = 1
	}
	scr_collideandmove()

}