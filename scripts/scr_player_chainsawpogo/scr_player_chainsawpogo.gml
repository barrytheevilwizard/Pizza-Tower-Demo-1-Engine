function scr_player_chainsawpogo(){
	scr_getinput();
	hsp = (xscale * movespeed);
	momemtum = 1;
	move2 = (key_right2 + key_left2);
	move = (key_right + key_left);
	if move == 1 * xscale
	{
		if movespeed < 10
		movespeed += 0.25
	}
	if move == -1 * xscale
	{
		if movespeed > -10
		movespeed -= 0.5
	}
	if sprite_index != spr_player_chainsawland && sprite_index != spr_player_chainsawspin
	sprite_index = spr_player_chainsawbounceair
	if grounded && vsp > 0 && sprite_index == spr_player_chainsawbounceair
	{
		sprite_index = spr_player_chainsawland
		image_index = 0
		vsp = -17
		image_index = 0;
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
	}
	else if grounded && vsp > 0 && sprite_index == spr_player_chainsawspin
	{
		if key_attack
		{
			if !key_down 
			{
				if movespeed < 12
				state = 56
				else 
				{
					sprite_index = spr_player_mach4
					state = 76
				}
				if movespeed < 0
				movespeed *= -1
				if move != 0 
				xscale = move
			}
			else
			{
				sprite_index = spr_player_machroll;
				machhitAnim = 0;
				state = 23;
				if move != 0 
				xscale = move
				if movespeed < 0
				movespeed *= -1
			}
		}
		else 
		state = 0
	}
	if floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawland
	sprite_index = spr_player_chainsawspin
	if key_down && sprite_index == spr_player_chainsawspin
	vsp += 1.25
	if key_slap2 && key_up
	{
	    state = 80;
	    image_index = 0;
		sprite_index = spr_player_slapup
		flash = 1
		vsp = -14
		scr_sound(sfx_suplexdash)
	}
	scr_collideandmove();
}