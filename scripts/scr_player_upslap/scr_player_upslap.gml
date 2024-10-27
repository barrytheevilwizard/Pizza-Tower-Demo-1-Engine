// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_upslap()
{
	if sprite_index == spr_player_slapup
	{
		vsp = Approach(vsp,0,0.5)
		grav = 0
	}
	else 
	grav = 0.5
	image_speed = 0.5
	hsp = (xscale * movespeed);
	momemtum = 1;
	move = (key_right + key_left);
	if move == 1 * xscale 
	movespeed = Approach(movespeed,8,0.75)
	else if move == -1 * xscale 
	movespeed = Approach(movespeed,-8,0.75)
	if move == 0
	movespeed = Approach(movespeed,0,0.75)
	if grounded && vsp > 0
	{
	    state = 0
		sprite_index = spr_player_land 
		image_index = 0
	}
	with instance_place(x,y,obj_baddie) 
	{
		instance_create(x, y - 30, obj_bumpeffect);
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player.x;
	    y = obj_player.y;
		stunned = 200
	    state = 89;
	    hsp = 0
	    vsp = -20;
		scr_sound(sound_enemyslap)
		with other 
		{
			scr_sound(sound_enemyslap);
	        state = 58;
	        vsp = -6
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x, (y - 10), obj_bangeffect);
			flash = 1
			grav = 0.5
		}
	}
	if key_down
	{
		grav = 0.5
		state = 79
		image_index = 0
		vsp = -6
		scr_sound(sfx_break)
	}
	if floor(image_index) == (image_number - 1) && vsp == 0 && sprite_index == spr_player_slapup
	sprite_index = spr_player_machfreefall
	else if floor(image_index) == (image_number - 1) && vsp != 0 && sprite_index == spr_player_slapup
	image_index = image_number - 1
	scr_collideandmove()
}