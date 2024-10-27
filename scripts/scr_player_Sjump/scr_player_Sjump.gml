function scr_player_Sjump(){
	scr_getinput();
	mach2 = 0;
	if sprite_index == spr_player_superjump || sprite_index == spr_player_backbreaker
	hsp = 0
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	momemtum = 1
	move = (key_left + key_right)
	if (sprite_index == spr_player_superjump)
	    vsp -= 0.65;
	if (sprite_index == spr_player_supersidejump)
	{
	    if (a < 25)
	        a++;
	    hsp = (xscale * a);
	    vsp = 0;
	}
	if place_meeting(x, (y - 1), obj_solid)
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
	if (key_slap2 || key_attack2) && sprite_index != spr_player_Sjumpcancelstart
	{
		sprite_index = spr_player_Sjumpcancelstart
		image_index = 0
	}
	if sprite_index == spr_player_Sjumpcancelstart
	{
		if move != 0
		xscale = move
		vsp = 0
	}
	if sprite_index == spr_player_backbreaker
		vsp = 0
	if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_backbreaker))
	{
		sprite_index = spr_player_superjump
		vsp = -12
		scr_sound(sound_superjump);
		instance_create(x, y, obj_explosioneffect);
	}
	if ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_Sjumpcancelstart))
	{
		state = 76
		image_index = 0
	    sprite_index = spr_player_Sjumpcancel;
		movespeed = 12
		vsp = -6
		flash = 1
	}
	image_speed = 0.5;
	scr_collideandmove();
}