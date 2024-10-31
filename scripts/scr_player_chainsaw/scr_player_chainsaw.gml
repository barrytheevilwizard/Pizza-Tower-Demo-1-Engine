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
			{
				state = 56
				movespeed = 8
			}
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
	if movespeed > 2
	movespeed -= 0.35
	if key_jump && place_meeting(x,y + 1,obj_collisionparent)
	{
		vsp = -11
		sprite_index = spr_player_longjump
		image_index = 0
		state = 56
		movespeed = 8
	}
	if (place_meeting((x + xscale), y, obj_collisionparent) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) && !place_meeting(x + hsp,y,obj_destructibles)
	{
	   machhitAnim = 0;
	   state = 3;
    }
	if move == -1 * xscale
	state = 0
	with instance_place(x,y,obj_baddie) 
	{
		with other 
		{
			scr_sound(sound_enemyslap);
	        state = 58;
	        hsp = -6 * xscale;
	        mach2 = 0;
	        image_index = 0;
	        instance_create((x + 10 * xscale), (y + 10), obj_bangeffect);
			flash = 1
			sprite_index = spr_player_slap1
		}
		instance_create((x + (obj_player.xscale * 30)), y, obj_bumpeffect);
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player.x;
	    y = obj_player.y;
		stunned = 200
	    state = 89;
	    hsp = ((obj_player.xscale) * 25);
	    vsp = -7;
		scr_sound(sound_enemyslap)
	}
	if (key_down && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    sprite_index = spr_player_crouchslip;
	    machhitAnim = 0;
	    state = 54;
		movespeed = 16
	}
	if key_slap2
	{
		state = 81
		movespeed = 10
		vsp = -6
		image_index = 0
		sprite_index = spr_player_faceplant
	}
	with instance_place(x + hsp,y,obj_destructibles)
	instance_destroy()
	scr_collideandmove();
}