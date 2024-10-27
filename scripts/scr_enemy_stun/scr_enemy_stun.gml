function scr_enemy_stun(){
	stunned--;
	sprite_index = stunfallspr;
	image_speed = 0.35;
	if (place_meeting(x,y + 1,obj_solid) && vsp > 0) || place_meeting(x,y - 1,obj_solid) || place_meeting(x,y + 1,obj_slope) || place_meeting(x,y + 1,obj_platform)
	{
	    hsp = Approach(hsp , 0,0.25)
	    if (thrown == 1)
	        instance_destroy();
	}
	
	if thrown && place_meeting(x + image_xscale,y,obj_solid)
	instance_destroy();
	scr_collideandmoveonlywall();
	if (floor(image_index) == (image_number - 1) && stunned < 0)
	{
	    vsp -= 4;
	    sprite_index = idlespr;
	    image_index = 0;
	    state = 79;
	}

}