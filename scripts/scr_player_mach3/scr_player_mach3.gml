function scr_player_mach3() {
	scr_getinput();
	if (windingAnim < 200)
	    windingAnim++;
	hsp = (xscale * movespeed);
	mach2 = 100;
	momemtum = 1;
	move = (key_right + key_left);
	if place_meeting(x,y + 1,obj_collisionparent)
	{
		if move == 1 * xscale
		{
			if movespeed < 16
			{
				with (instance_place(x, (y + 1), obj_slope))
				{
					if (sign(image_xscale) == (sign(other.xscale)))
					other.movespeed -= 0.025
				}	
				movespeed += 0.025
			}
			else 
			{
				with (instance_place(x, (y + 1), obj_slope))
				{
					if (sign(image_xscale) == (sign(other.xscale)))
					other.movespeed -= 0.01
				}
				if movespeed < 20
				movespeed += 0.01
			}
		}
	}
	with (instance_place(x, (y + 1), obj_slope))
    {
        if (sign(image_xscale) == (-sign(other.xscale)))
        {
            if (abs(image_yscale) < abs(image_xscale))
                other.movespeed += 0.15
            else
                other.movespeed += 0.30
        }
    }
	crouchslideAnim = 1;
	if ((input_buffer_jump < 8) && (place_meeting(x, (y + 1), obj_collisionparent) && ((!((move == 1) && (xscale == -1))) && ((!((move == -1) && (xscale == 1))) && key_attack))))
	{
	    scr_sound(sound_jump);
	    image_index = 0;
	    sprite_index = spr_player_mach3jump;
	    vsp = -11;
	}
	if (place_meeting(x, y, obj_solid) || ((sprite_index == spr_player_mach3jump) && (floor(image_index) == (image_number - 1))))
	    sprite_index = spr_player_mach4;
	if sprite_index != spr_player_mach3 && sprite_index != spr_player_mach3jump && sprite_index != spr_player_Sjumpcancel
	sprite_index = spr_player_mach4
	if place_meeting(x,y + 1,obj_collisionparent) && sprite_index == spr_player_Sjumpcancel
	sprite_index = spr_player_mach4
	if ((!key_jump2) && ((jumpstop == 0) && ((vsp < 0.5) && (stompAnim == 0))))
	{
	    vsp /= 2;
	    jumpstop = 1;
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && (vsp > 0))
	    jumpstop = 0;
	if key_jump
	    input_buffer_jump = 0;
	if (key_up && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    sprite_index = spr_player_superjumpprep;
	    state = 51;
	    hsp = 0;
	    image_index = 0;
		
	}
	if ((!key_attack) && (place_meeting(x, (y + 1), obj_collisionparent) && (autodash == 0)))
	{
	    mach2 = 0;
	    sprite_index = spr_player_machslidestart;
	    flash = 0;
	    state = 57;
	    image_index = 0;
	}
	if (((move == -1) && (xscale == 1)) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    sprite_index = spr_player_machslideboost3;
	    flash = 0;
	    state = 57;
	    image_index = 0;
	    mach2 = 100;
	}
	if (((move == 1) && (xscale == -1)) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    sprite_index = spr_player_machslideboost3;
	    flash = 0;
	    state = 57;
	    image_index = 0;
	    mach2 = 100;
	}
	if (key_down && (place_meeting(x, (y + 1), obj_collisionparent) && (!place_meeting(x, y, obj_dashpad))))
	{
	    instance_create(x, y, obj_jumpdust);
	    flash = 0;
	    state = 23;
	}
	else if (key_down && !place_meeting(x, (y + 1), obj_collisionparent))
	{
	    sprite_index = spr_player_mach2jump;
	    machhitAnim = 0;
	    state = 23;
		vsp = 10
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && !place_meeting(x,y + 1,obj_slope))
	{
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
	}
	else if (!place_meeting(x,y + 1,obj_solid) || place_meeting(x,y + 1,obj_slope))
	{
		if place_meeting(x + xscale,y,obj_solid) && !place_meeting(x + hsp,y,obj_destructibles) && !place_meeting(x + hsp,y,obj_metalblock)
		{
			machhitAnim = 0;
			state = 3;
		}
	}
	if place_meeting(x, (y + 1), obj_onewaywatersolid)
	{
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	}
	if (!instance_exists(obj_chargeeffect))
	    instance_create(x, y, obj_chargeeffect)
	if ((!instance_exists(obj_superdashcloud)) && (place_meeting(x, (y + 1), obj_collisionparent) && (!place_meeting(x, (y + 1), obj_water))))
	    instance_create(x, y, obj_superdashcloud)
	if (key_slap2 && ((shotgunAnim == 1) && ((global.ammo > 0) && (!place_meeting(x, (y + 1), obj_collisionparent)))))
	{
	    global.ammo -= 1
	    instance_create(x, (y + 80), obj_shotgunbulletdown)
	    vsp -= 11
	    sprite_index = spr_player_shotgunjump1
	    state = 24
	    image_index = 0
	}
	if (key_slap2 && ((shotgunAnim == 0) && (!((sprite_index == spr_player_facestomp) || (sprite_index == spr_player_freefall)))))
	{
	    state = 19;
	    image_index = 0;
		if movespeed < 4
		movespeed = 4
		if !place_meeting(x,y + 1,obj_collisionparent)
		sprite_index = spr_player_suplexgrabjumpstart
		else
		sprite_index = spr_player_suplexdash
		scr_sound(sfx_suplexdash)
	}
	image_speed = 0.4;
	scr_collideandmove();
}