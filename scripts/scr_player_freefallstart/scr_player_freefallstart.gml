// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_freefallstart()
{
	momemtum = 1
	hsp = (move * movespeed);
	sprite_index = spr_player_freefallprep
	move = (key_right + key_left);
	if move == -1 * xscale 
	movespeed = 0
	movespeed = Approach(movespeed,6,0.25)
	if vsp > 0
	vsp += 0.5
	if grounded && !place_meeting(x,y + vsp,obj_metalblock)
	{
	    image_index = 0;
	    state = 63;
	    jumpAnim = 1;
	    jumpstop = 0;
	    with (obj_baddie)
	    {
	        if point_in_rectangle(x, y, view_xport[0], view_yport[0], (view_xport[0] + view_wport[0]), (view_yport[0] + view_hport[0]))
	        {
	            vsp = -7;
	            hsp = 0;
	        }
	    }
	    with (obj_camera)
	    {
	        shake_mag = 10;
	        shake_mag_acc = (30 / room_speed);
	    }
	    combo = 0;
	    bounce = 0;
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud);
	    freefallstart = 0;
	}
	with instance_place(x,y + vsp,obj_metalblock)
	instance_destroy()
	with instance_place(x,y + vsp,obj_destructibles)
	instance_destroy()
	image_speed = 0.35;
	scr_collideandmove();
	

}