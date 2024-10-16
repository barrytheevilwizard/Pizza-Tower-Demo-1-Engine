function scr_collideandmove() {
	var vy = vsp;
	grounded = 0
	repeat abs(vy)
	{
	    if !scr_solid_player(x, y + sign(vsp))
	    {
	        y += sign(vsp);
	        vy -= 1
		
	        if vy
	            continue;
	    }
	    else
		{
	        vsp = 0;
			break;
		}
	}

	var vx = abs(hsp);
	repeat abs(vx)
	{
	   if (scr_solid_player((x + sign(hsp)), y) && (!(scr_solid_player((x + sign(hsp)), (y - 1)))))
            y--
        if ((!(scr_solid_player((x + sign(hsp)), y))) && (!(scr_solid_player((x + sign(hsp)), (y + 1)))) && scr_solid_player((x + sign(hsp)), (y + 2)))
            y++
        if (!(scr_solid_player((x + sign(hsp)), y)))
        {
            x += sign(hsp)
            if (abs(hsp) - 1)
                continue
            break
        }
        else
            hsp = 0
	}
	grounded |= scr_solid(x, (y + 1))
	grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
	if vsp < 20 // gravity cap
	    vsp += grav;
}