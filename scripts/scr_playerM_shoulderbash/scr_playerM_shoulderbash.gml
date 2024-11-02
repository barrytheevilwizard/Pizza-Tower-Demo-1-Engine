// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerM_shoulderbash()
{
	hsp = (xscale * movespeed);
	move = (key_right + key_left);
	image_speed = 0.5
	if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_grabmove))
	{
		movespeed = 4
		sprite_index = spr_playerM_shoulderbash
		flash = 1
	}
	if sprite_index == spr_player_grabmove
	movespeed = Approach(movespeed,-4,0.5)
	if sprite_index == spr_playerM_shoulderbash && grounded
	{
		if movespeed < 8
		movespeed += 0.5
		else 
		{
			if movespeed < 15
			movespeed += 0.15
		}
	}
	if (!instance_exists(obj_chargeeffect)) && sprite_index != spr_player_grabmove
	    instance_create(x, y, obj_chargeeffect)
	if !key_attack
	state = 0
	if place_meeting(x + xscale,y,obj_solid)
	{
		vsp = -17
		xscale *= -1
		sprite_index = spr_player_Sjumpcancelstart
		image_index = 0
		movespeed = 10
		state = 83
	}
	if !grounded
	{
		movespeed = Approach(movespeed,5,0.25)
		vsp += 0.5
	}
	scr_collideandmove()
}