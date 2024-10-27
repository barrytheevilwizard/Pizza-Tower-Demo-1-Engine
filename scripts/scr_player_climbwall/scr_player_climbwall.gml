function scr_player_climbwall()
{
	scr_getinput();
	if (windingAnim < 200)
	    windingAnim++;
	vsp = (-movespeed);
	if movespeed < 12
	movespeed += 0.25
	crouchslideAnim = 1;
	sprite_index = spr_player_climbwall;
	if (!key_attack)
	{
	    state = 44;
	    sprite_index = spr_player_fall;
	}
	if (!place_meeting((x + xscale), y, obj_collisionparent))
	{
	    instance_create(x, y, obj_jumpdust);
	    vsp = 0;
		if movespeed < 12
		state = 56
		else 
		{
			sprite_index = spr_player_mach4
			state = 76
		}
	}
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect))
	    instance_create(x, (y + 43), obj_cloudeffect);
	if (key_jump && key_attack)
	{
	    instance_create(x, y, obj_jumpdust);
	    vsp = -9;
	    state = 56;
	    xscale *= -1;
		movespeed = 8
	}
	scr_collideandmove();
}