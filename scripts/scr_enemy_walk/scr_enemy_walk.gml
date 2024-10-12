function scr_enemy_walk(){
	if (place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform)))))
	    hsp = (image_xscale * movespeed);
	else
	    hsp = 0;
	if (roaming == 0 && (place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))))
	{
	    hsp = 0;
	    state = 79;
	    image_index = 0;
	}
	if (place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform)))))
	    sprite_index = walkspr;
	else
	{
	    sprite_index = idlespr;
	    state = 79;
	}
	image_speed = 0.35;
	if (((place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == 1) || (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    image_xscale *= -1;
	if ((!((place_meeting((x + 15), (y + 31), obj_enemiesbumpable) || place_meeting((x + 15), (y + 31), obj_platform)))) && image_xscale == 1)
	    image_xscale *= -1;
	if ((!((place_meeting((x - 15), (y + 31), obj_enemiesbumpable) || place_meeting((x - 15), (y + 31), obj_platform)))) && image_xscale == -1)
	    image_xscale *= -1;
	if ((!((place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))))) && hsp < 0)
	    hsp += 0.1;
	else if ((!((place_meeting(x, (y + 1), obj_enemiesbumpable) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform))))))) && hsp > 0)
	    hsp -= 0.1;
	scr_collideandmoveonlywall();
}