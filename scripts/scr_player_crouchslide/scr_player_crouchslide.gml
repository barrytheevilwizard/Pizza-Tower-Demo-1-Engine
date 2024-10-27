function scr_player_crouchslide() {
	scr_getinput();
	hsp = (xscale * movespeed);
	if (movespeed >= 0) && grounded
	    movespeed -= 0.2;
	mask_index = spr_crouchmask;
	if  (!key_down) && (!place_meeting(x, (y - 3), obj_collisionparent)) && movespeed <= 10
	{
	    machhitAnim = 1;
	    state = 56;
	}
	if ((((hsp == 0) || ((place_meeting((x + 1), y, obj_collisionparent) && (xscale == 1)) || (place_meeting((x - 1), y, obj_collisionparent) && (xscale == -1)))) && (!place_meeting((x + sign(hsp)), y, obj_slope))) || (movespeed <= 0))
	{
	    state = 52;
	    movespeed = 0;
	    mach2 = 0;
	    crouchslideAnim = 1;
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
	if ((!instance_exists(obj_slidecloud)) && (place_meeting(x, (y + 1), obj_collisionparent) && (movespeed > 5)))
	    instance_create(x, y, obj_slidecloud);
	image_speed = 0.35;
	scr_collideandmove();
}