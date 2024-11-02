function scr_player_crouchslide() {
	scr_getinput();
	hsp = (xscale * movespeed);
	if (movespeed >= 0) && grounded && sprite_index == spr_player_crouchslip
	    movespeed -= movespeed / 24;
	else if (movespeed >= 0) && grounded && sprite_index != spr_player_crouchslip
		movespeed += -0.25
	mask_index = spr_crouchmask;
	if  (!key_down) && (!place_meeting(x, (y - 3), obj_collisionparent)) && movespeed <= 10
	{
	    sprite_index = spr_player_machhit
	    state = 56;
	}
	if ((((hsp == 0) || ((place_meeting((x + 1), y, obj_collisionparent) && (xscale == 1)) || (place_meeting((x - 1), y, obj_collisionparent) && (xscale == -1)))) && (!place_meeting((x + sign(hsp)), y, obj_slope))) || (movespeed <= 0))
	{
	    state = 52;
	    movespeed = 0;
	    mach2 = 0;
	    image_index = 0;
	    crouchAnim = 1;
	    start_running = 1;
	    alarm[4] = 14;
	}
	if ((place_meeting((x + xscale), y, obj_collisionparent)) && (!place_meeting((x + sign(hsp)), y, obj_slope)))
	{
	    movespeed = 0;
	    state = 58;
	    hsp = -2.5 * xscale;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    machslideAnim = 1;
	    machhitAnim = 0;
	    instance_create((x + 10), (y + 10), obj_bumpeffect);
		sprite_index = spr_player_bump;
		
	}
	vsp += 0.25
	if !grounded
	{
		if sprite_index != spr_player_jumpdive1
		sprite_index = spr_player_jumpdive2
	}
	else 
	sprite_index = spr_player_crouchslip
	if key_jump && grounded && vsp > 0
	{
		vsp = -17
		sprite_index = spr_player_jumpdive1
		image_index = 0
	}
	with instance_place(x + hsp,y,obj_destructibles)
	instance_destroy()
	if (floor(image_index) == (image_number - 1)) && sprite_index == spr_player_jumpdive1
	    sprite_index = spr_player_jumpdive2
	if ((!instance_exists(obj_slidecloud)) && (place_meeting(x, (y + 1), obj_collisionparent) && (movespeed > 5)))
	    instance_create(x, y, obj_slidecloud);
	image_speed = 0.35;
	scr_collideandmove();
}