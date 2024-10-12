function scr_player_Sjump(){
	scr_getinput();
	hsp = 0;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	if (sprite_index == spr_player_superjump)
	    vsp--;
	if (sprite_index == spr_player_supersidejump)
	{
	    if (a < 25)
	        a++;
	    hsp = (xscale * a);
	    vsp = 0;
	}
	if (place_meeting(x, (y - 1), obj_collisionparent) && ((!place_meeting(x, (y - 1), obj_destructibles)) && ((!place_meeting((x + sign(hsp)), y, obj_slope)) && (!place_meeting((x - sign(hsp)), y, obj_slope)))))
	{
	    scr_sound(sound_enemystomp);
	    a = 0;
	    if (sprite_index == spr_player_supersidejump)
	        sprite_index = spr_player_supersidejumpland;
	    if (sprite_index == spr_player_superjump)
	        sprite_index = spr_player_superjumpland;
	    with (obj_camera)
	    {
	        shake_mag = 10;
	        shake_mag_acc = (30 / room_speed);
	    }
	    with (obj_baddie)
	    {
	        if point_in_rectangle(x, y, view_xport[0], view_yport[0], (view_xport[0] + view_wport[0]), (view_yport[0] + view_hport[0]))
	        {
	            image_index = 0;
	            state = 79;
	            vsp = -7;
	            hsp = 0;
	        }
	    }
	    combo = 0;
	    image_index = 0;
	    state = 78;
	    machhitAnim = 0;
	}
	image_speed = 0.5;
	scr_collideandmovesuperjump();
}