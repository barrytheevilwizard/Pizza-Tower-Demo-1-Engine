function scr_player_chainsaw()
{
	image_speed = 0.5
	if ((sprite_index == spr_player_suplexdash) && (floor(image_index) == (image_number - 1))) || (place_meeting(x,y + 1,obj_collisionparent) && (sprite_index == spr_player_suplexdashjump || sprite_index == spr_player_suplexgrabjumpstart))
	{
		if !key_attack 
		{
			 sprite_index = spr_player_land
			 state = 0
		}
		else
		{
			if movespeed < 12
			state = 56
			else 
			{
				sprite_index = spr_player_mach4
				state = 76
			}
		}
	}
	if ((sprite_index == spr_player_suplexgrabjumpstart) && (floor(image_index) == (image_number - 1)))
	sprite_index = spr_player_suplexdashjump
	if !place_meeting(x,y + 1,obj_collisionparent) && sprite_index != spr_player_suplexgrabjumpstart
	sprite_index = spr_player_suplexdashjump
	scr_getinput();
	hsp = (xscale * movespeed);
	move = (key_right + key_left);
	if movespeed < 10
	movespeed += 0.5
	if key_jump && place_meeting(x,y + 1,obj_collisionparent)
	{
		vsp = -11
		sprite_index = spr_player_secondjump1
		image_index = 0
		state = 56
	}
	if (place_meeting((x + xscale), y, obj_collisionparent) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) && !place_meeting(x + hsp,y,obj_destructibles)
	{
	   machhitAnim = 0;
	   state = 3;
    }
	if move == -1 * xscale
	state = 0
	if place_meeting(x + hsp,y,obj_baddie)
	{
		state = 14
		instance_nearest(x,y,obj_baddie).state = 92
		scr_sound(sound_enemyslap)
		flash = 1
	}
	if (key_down && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    sprite_index = spr_player_machroll;
	    machhitAnim = 0;
	    state = 23;
	}
	with instance_place(x + hsp,y,obj_destructibles)
	instance_destroy()
	scr_collideandmove();
}