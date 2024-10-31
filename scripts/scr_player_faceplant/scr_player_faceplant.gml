// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_faceplant()
{
	if sprite_index != spr_player_faceplant
	sprite_index = spr_player_faceplant
	movespeed = Approach(movespeed,12,0.1)
	hsp = (xscale * movespeed);
	momemtum = 1;
	move = (key_right + key_left);
	if floor(image_index) == (image_number - 1)
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
	if !grounded && key_down
	{
		state = 79
		image_index = 0
		vsp = -6
		scr_sound(sfx_break)
	}
	if (place_meeting((x + xscale), y, obj_collisionparent) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    {
	        scr_sound(sound_enemystomp);
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = (40 / room_speed);
	        }
	        image_speed = 0.35;
	        flash = 0;
	        combo = 0;
	        state = 58;
	        hsp = 2.5 + xscale;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create((x - 10), (y + 10), obj_bumpeffect);
	    }
		if key_jump 
		{
			state = 56
			vsp = -11
			sprite_index = spr_player_mach2jump
			movespeed = 8
		}
	scr_collideandmove()
	
}