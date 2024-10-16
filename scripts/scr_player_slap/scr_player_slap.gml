function scr_player_slap()
{
	scr_collideandmove();
	hsp = (xscale * movespeed);
	move = (key_right + key_left);
	momemtum = 1;
	if !instance_exists(obj_chainsawhitbox)
	instance_create(x,y,obj_chainsawhitbox)
	if move == 1 * xscale 
	{
		if movespeed < 10
		movespeed += 0.25
	}
	if move == -1 * xscale 
		movespeed -= 0.75 
	if move == 0
		movespeed = Approach(movespeed,0,0.75)
	if movespeed <= 0
	{
		if move != 0
		xscale = move 
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawstart)
	sprite_index = spr_player_chainsawend
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawswing)
	sprite_index = spr_player_chainsawend
	if sprite_index != spr_player_chainsaw
	{
		if place_meeting(x, y + 1,obj_collisionparent) && vsp > 0
		{
			if move == 0
			sprite_index = spr_player_chainsawend
			else if move != 0
			sprite_index = spr_player_chainsaw
		}
		else
		sprite_index = spr_player_chainsawair
	}
	if key_jump && place_meeting(x, y + 1,obj_collisionparent)
		vsp = -13
	if !key_slap
	{
		state = 19
		movespeed = 10
		vsp = -8
		scr_sound(sound_jump)
	}
}