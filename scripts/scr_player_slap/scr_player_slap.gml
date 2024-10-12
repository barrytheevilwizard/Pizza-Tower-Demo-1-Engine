function scr_player_slap(){
	scr_getinput();
	if (!place_meeting(x, (y + 1), obj_collisionparent))
	{
	    move = (key_left + key_right);
	    fallinganimation++;
	    if ((fallinganimation >= 40) && (fallinganimation < 80))
	    {
	        sprite_index = spr_player_facestomp;
	        state = 44;
	    }
	    if (momemtum == 0)
	        hsp = (move * movespeed);
	    else
	        hsp = (xscale * movespeed);
	    if ((move != xscale) && ((momemtum == 1) && (movespeed != 0)))
	        movespeed -= 0.05;
	    if (movespeed == 0)
	        momemtum = 0;
	    if (((move == 0) && (momemtum == 0)) || place_meeting((x + hsp), y, obj_collisionparent))
	        movespeed = 0;
	    if ((move != 0) && (movespeed < 6))
	        movespeed += 0.25;
	    if (movespeed > 6)
	        movespeed -= 0.05;
	    if (((place_meeting(x, (y + 1), obj_collisionparent) && (move == 1)) || (place_meeting((x - 1), y, obj_collisionparent) && (move == -1))) && (!place_meeting((x + sign(hsp)), y, obj_slope)))
	        movespeed = 0;
	    if (dir != xscale)
	    {
	        dir = xscale;
	        movespeed = 0;
	    }
	    if (move == (-xscale))
	    {
	        movespeed = 0;
	        momemtum = 0;
	    }
	}
	if ((movespeed > 0) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    movespeed -= 0.2;
	    hsp = (xscale * movespeed);
	}
	landAnim = 0;
	if key_slap2
	    slapbuffer = 0;
	if ((floor(image_index) == 1) && (!instance_exists(obj_slaphitbox)))
	    instance_create(x, y, obj_slaphitbox);
	if ((floor(image_index) == (image_number - 1)) && (slapbuffer == 8))
	{
	    if place_meeting(x, (y + 1), obj_collisionparent)
	        state = 0;
	    else
	    {
	        sprite_index = spr_player_fall;
	        state = 44;
	    }
	}
	if ((floor(image_index) == (image_number - 1)) && (slapbuffer < 8))
	{
	    if place_meeting(x, (y + 1), obj_collisionparent)
	    {
	        if (slaphand == 1)
	            sprite_index = spr_player_slap1;
	        if (slaphand == -1)
	            sprite_index = spr_player_slap2;
	    }
	    else
	    {
	        if (slaphand == 1)
	            sprite_index = spr_player_slap1air;
	        if (slaphand == -1)
	            sprite_index = spr_player_slap2air;
	    }
	    image_index = 0;
	    slaphand *= -1;
	}
	scr_collideandmove();
	if ((!instance_exists(obj_slidecloud)) && (place_meeting(x, (y + 1), obj_collisionparent) && (movespeed > 4)))
	    instance_create(x, y, obj_slidecloud);
	if (place_meeting(x, (y + 1), obj_collisionparent) && (sprite_index == spr_player_slap1air))
	    sprite_index = spr_player_slap1;
	if (place_meeting(x, (y + 1), obj_collisionparent) && (sprite_index == spr_player_slap2air))
	    sprite_index = spr_player_slap2;
	if (move != 0)
	    xscale = move;
	image_speed = 0.35;
}