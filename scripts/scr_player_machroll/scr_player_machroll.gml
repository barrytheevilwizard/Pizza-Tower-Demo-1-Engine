function scr_player_machroll()
{
	scr_getinput();
	hsp = (xscale * movespeed);
	mach2 = 100;
	machslideAnim = 1;
	move = (key_right + key_left);
	if !place_meeting(x,y - 3,obj_collisionparent) && !key_down && grounded
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
	if place_meeting((x + xscale), y, obj_collisionparent) && !place_meeting((x + xscale), y, obj_destructibles) && !place_meeting((x + xscale), y, obj_slope)
	{
	    with (obj_camera)
	    {
	        shake_mag = 20;
	        shake_mag_acc = (40 / room_speed);
	    }
	    hsp = 0;
	    image_speed = 0.35;
	    with (obj_baddie)
	    {
	        if point_in_rectangle(x, y, view_xport[0], view_yport[0], (view_xport[0] + view_wport[0]), (view_yport[0] + view_hport[0]))
	        {
	            stun = 1;
	            alarm[0] = 200;
	            ministun = 0;
	            vsp = -5;
	            hsp = 0;
	            image_xscale *= -1;
	        }
	    }
	    flash = 0;
	    combo = 0;
	    state = 58;
	    hsp = -2.5 * xscale;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create((x - 10), (y + 10), obj_bumpeffect);
		sprite_index = spr_player_bump;
		
	}
	if ((place_meeting(x, (y + 1), obj_solid)) || (place_meeting(x, (y + 1), obj_slope))) && !place_meeting((x + xscale), y, obj_collisionparent) && sprite_index != spr_player_machroll
		sprite_index = spr_player_machroll;
	else if !place_meeting(x,y + 1,obj_collisionparent) && sprite_index != spr_player_dive
	{
		vsp = 10
		sprite_index = spr_player_dive
	}
	
	if sprite_index == spr_player_dive && key_jump
	{
		state = 79
		image_index = 0
		vsp = -6
		scr_sound(sfx_break)
	}
	with instance_place(x,y + 1,obj_slope) 
	{
		if (sign(image_xscale) == (-sign(other.xscale)))
        {
			if other.movespeed < 12
			{
				if (abs(image_yscale) < abs(image_xscale))
					other.movespeed += 0.25
				else
					other.movespeed += 0.5
			}
        }
		if (sign(image_xscale) == (sign(other.xscale)))
        {
			if other.movespeed > 10
			{
				if (abs(image_yscale) < abs(image_xscale))
					other.movespeed -= 0.25
				else
					other.movespeed -= 0.5
			}
        }
	}
	if movespeed < 6
	movespeed += 0.25
	if ((!instance_exists(obj_cloudeffect)) && (place_meeting(x, (y + 1), obj_collisionparent) && (!place_meeting(x, (y + 1), obj_water)))) instance_create(x, (y + 43), obj_cloudeffect)
		image_speed = 0.8;
	scr_collideandmove();
}