function scr_player_normal() {
	scr_getinput()
	if (dir != xscale)
	{
	    dir = xscale;
	    movespeed = 2;
	    facehurt = 0;
	}
	mach2 = 0;
	move = (key_left + key_right);
	hsp = (move * movespeed);
	if ((machslideAnim == 0) && ((landAnim == 0) && (shotgunAnim == 0)))
	{
	    if (move == 0)
	    {
	        if (idle < 400)
	            idle++;
	        if ((idle >= 300) && (floor(image_index) == (image_number - 1))) {
	            shotgunAnim = 0;
	            facehurt = 0;
	            idle = 0;
	            image_index = 0;
	        }
	        if ((idle >= 300) && ((sprite_index != spr_player_idlefrown) && ((sprite_index != spr_player_idledance) && ((sprite_index != spr_player_idlevomit) && ((sprite_index != spr_player_idlevomitblood) && ((sprite_index != spr_player_handgesture1) && ((sprite_index != spr_player_handgesture2) && ((sprite_index != spr_player_handgesture3) && (sprite_index != spr_player_handgesture4))))))))) {
	            randomize();
	            idleanim = random_range(0, 100);
	            if (idleanim < 16)
	                sprite_index = spr_player_idlefrown;
	            if ((idleanim < 32) && (idleanim >= 16))
	                sprite_index = spr_player_handgesture1;
	            if ((idleanim < 48) && (idleanim >= 32))
	                sprite_index = spr_player_handgesture2;
	            if ((idleanim < 64) && (idleanim >= 48))
	                sprite_index = spr_player_handgesture3;
	            if ((idleanim < 80) && (idleanim >= 64))
	                sprite_index = spr_player_handgesture4;
	            if ((idleanim < 98) && (idleanim >= 80))
	                sprite_index = spr_player_idledance;
	            if ((idleanim < 99) && (idleanim >= 98))
	                sprite_index = spr_player_idlevomit;
	            if (idleanim >= 99)
	                sprite_index = spr_player_idlevomitblood;
	            image_index = 0;
	        }
	        if (idle < 300)
	        {
	            if (facehurt == 0)
	            {
	                if (windingAnim < 50)
	                {
	                    start_running = 1
	                    movespeed = 0
	                    sprite_index = spr_player_idle
	                }
	                else
	                {
	                    idle = 0
	                    windingAnim--
	                    sprite_index = spr_player_winding
	                }
	            }
	            else if (facehurt == 1)
	            {
	                windingAnim = 0
	                if ((sprite_index != spr_player_facehurtup) && (sprite_index != spr_player_facehurt))
	                    sprite_index = spr_player_facehurtup
	                if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_facehurtup))
	                    sprite_index = spr_player_facehurt
	            }
	        }
	    }
	    if (move != 0)
	    {
	        machslideAnim = 0;
	        idle = 0;
	        facehurt = 0;
	        sprite_index = spr_player_move;
	    }
	    if (move != 0)
	        xscale = move;
	}
	if (landAnim == 1)
	{
	    if (shotgunAnim == 0)
	    {
	        if (move == 0)
	        {
	            movespeed = 0;
	            sprite_index = spr_player_land;
	            if (floor(image_index) == 5)
	                landAnim = 0;
	        }
	        if (move != 0)
	        {
	            sprite_index = spr_player_land2;
	            if (floor(image_index) == 4)
	            {
	                landAnim = 0;
	                sprite_index = spr_player_move;
	                image_index = 0;
	            }
	        }
	    }
	    if (shotgunAnim == 1)
	    {
	        sprite_index = spr_shotgun_land;
	        if (floor(image_index) == (image_number - 1))
	        {
	            landAnim = 0;
	            sprite_index = spr_player_move;
	            image_index = 0;
	        }
	    }
	}
	if (machslideAnim == 1)
	{
	    sprite_index = spr_player_machslideend;
	    if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_machslideend))
	        machslideAnim = 0;
	}
	if ((sprite_index == spr_player_shotgun) && (floor(image_index) == (image_number - 1)))
	    sprite_index = spr_shotgun_idle;
	if (landAnim == 0)
	{
	    if ((shotgunAnim == 1) && ((move == 0) && (sprite_index != spr_player_shotgun)))
	        sprite_index = spr_shotgun_idle;
	    else if ((shotgunAnim == 1) && (sprite_index != spr_player_shotgun))
	        sprite_index = spr_shotgun_walk;
	}
	if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && ((xscale == 1) && ((move == 1) && (!place_meeting((x + 1), y, obj_slope)))))
	    movespeed = 0;
	if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && ((xscale == -1) && ((move == -1) && (!place_meeting((x - 1), y, obj_slope)))))
	    movespeed = 0;
	jumpstop = 0;
	if ((!place_meeting(x, (y + 1), obj_collisionparent)) && (!key_jump))
	{
	    if (shotgunAnim == 0)
	        sprite_index = spr_player_fall;
	    else
	        sprite_index = spr_shotgun_fall;
	    jumpAnim = 0;
	    state = 44;
	    image_index = 0;
	}
	if ((key_attack && (place_meeting(x, (y + 1), obj_collisionparent)) && ((!(place_meeting((x + 1), y, obj_collisionparent) && ((xscale == 1) && (!place_meeting((x + xscale), y, obj_slope))))) && (!(place_meeting((x - 1), y, obj_collisionparent) && ((xscale == -1) && (!place_meeting((x + xscale), y, obj_slope)))))))) && global.character == "P"
	{
	    sprite_index = spr_player_mach1;
	    jumpAnim = 1;
	    state = 56;
	    image_index = 0;
	}
	else if ((key_attack && (place_meeting(x, (y + 1), obj_collisionparent)) && ((!(place_meeting((x + 1), y, obj_collisionparent) && ((xscale == 1) && (!place_meeting((x + xscale), y, obj_slope))))) && (!(place_meeting((x - 1), y, obj_collisionparent) && ((xscale == -1) && (!place_meeting((x + xscale), y, obj_slope)))))))) && global.character == "M"
	{
	    sprite_index = spr_player_grabmove;
	    jumpAnim = 1;
	    state = 82;
	    image_index = 0;
		movespeed = 0
	}
	if (key_jump && (place_meeting(x, (y + 1), obj_collisionparent)) && (!key_down))
	{
	    scr_sound(sound_jump);
	    if (shotgunAnim == 1)
	        sprite_index = spr_shotgun_jump;
		else 
		sprite_index = spr_player_jump;
	    instance_create(x, y, obj_highjumpcloud2);
	    vsp = -11;
	    state = 44;
	    image_index = 0;
	    jumpAnim = 1;
	}
	if ((place_meeting(x, (y + 1), obj_collisionparent)) && ((input_buffer_jump < 8) && ((!key_down) && ((!key_attack) && (vsp > 0)))))
	{
	    scr_sound(sound_jump);
	    if (shotgunAnim == 1)
	        sprite_index = spr_shotgun_jump;
		else 
		sprite_index = spr_player_jump;
	    instance_create(x, y, obj_highjumpcloud2);
	    stompAnim = 0;
	    vsp = -11;
	    state = 44;
	    jumpAnim = 1;
	    jumpstop = 0;
	    image_index = 0;
	    if (!place_meeting(x, y, obj_water2))
	        instance_create(x, y, obj_landcloud);
	    freefallstart = 0;
	}
	if ((key_down && (place_meeting(x, (y + 1), obj_collisionparent))) || place_meeting(x, (y - 3), obj_collisionparent))
	{
	    state = 52;
	    landAnim = 0;
	    crouchAnim = 1;
	    image_index = 0;
	    idle = 0;
	}
	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.5;
	    else if (floor(movespeed) == 6)
	        movespeed = 6;
	}
	else
	    movespeed = 0;
	if (movespeed > 6)
	    movespeed -= 0.1;
	if (key_slap2 && ((shotgunAnim == 1) && ((global.ammo > 0) && (!instance_exists(obj_cutscene_upstairs)))))
	{
	    global.ammo -= 1;
	    instance_create(x, y, obj_shotgunbullet);
	    sprite_index = spr_player_shotgun;
	    state = 24;
	    image_index = 0;
	}
	momemtum = 1;
	if (move != 0)
	{
	    xscale = move;
	    if ((movespeed < 3) && (move != 0))
	        image_speed = 0.35;
	    else if ((movespeed > 3) && (movespeed < 6))
	        image_speed = 0.45;
	    else
	        image_speed = 0.6;
	}
	else
	    image_speed = 0.35;
	if (key_slap2 && (shotgunAnim == 0)) && !key_up
	{
	    state = 19;
	    image_index = 0;
		sprite_index = spr_player_suplexdash
		if movespeed < 13
		movespeed = 13
		scr_sound(sfx_suplexdash)
	}
	else if (key_slap2 && (shotgunAnim == 0)) && key_up
	{
	    state = 80;
	    image_index = 0;
		sprite_index = spr_player_slapup
		flash = 1
		vsp = -14
		scr_sound(sfx_suplexdash)
	}
	if ((!instance_exists(obj_cloudeffect)) && (place_meeting(x, (y + 1), obj_collisionparent)) && ((move != 0) && ((floor(image_index) == 4) || (floor(image_index) == 10))))
	    instance_create(x, (y + 43), obj_cloudeffect);
	if ((!instance_exists(obj_cloudeffect)) && (place_meeting(x, (y + 1), obj_collisionparent)) && ((move != 0) && ((sprite_index == spr_player_downslopes) || (sprite_index == spr_player_upslopes))))
	    instance_create(x, (y + 43), obj_cloudeffect);
	scr_collideandmove();
}