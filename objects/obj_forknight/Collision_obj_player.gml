if (state != 92)
{
    with (obj_player)
    {
        if (y < other.y && attacking == 0 && state == 44 && vsp > 0)
        {
            scr_sound(sound_enemystomp);
            if (vsp > 0)
            {
                other.hp = 0;
                other.stunned = 200;
                if (x != other.x)
                    other.image_xscale = (-(sign((other.x - x))));
                image_index = 0;
                if key_jump2
                {
                    other.vsp = -5;
                    other.hsp = ((-other.image_xscale) * 3);
                    instance_create(x, (y + 50), obj_stompeffect);
                    other.state = 89;
                    stompAnim = 1;
                    other.image_index = 0;
                    vsp = -14;
                    sprite_index = spr_player_stompprep;
                }
                else
                {
                    other.vsp = -5;
                    other.hsp = ((-other.image_xscale) * 3);
                    instance_create(x, (y + 50), obj_stompeffect);
                    other.state = 89;
                    stompAnim = 1;
                    other.image_index = 0;
                    vsp = -9;
                    sprite_index = spr_player_stompprep;
                }
            }
        }
        if (state == 55)
        {
            scr_sound(sound_enemyslap);
            instance_create(x, y, obj_bumpeffect);
            other.stunned = 40;
            if (x != other.x)
                other.image_xscale = (-(sign((other.x - x))));
            other.vsp = -5;
            other.hsp = ((-other.image_xscale) * 3);
            hsp = ((-xscale) * 4);
            vsp = -4;
            machpunchAnim = 1;
            if (x != other.x)
                other.image_xscale = (-(sign((other.x - x))));
            other.state = 89;
            image_index = 0;
            state = 43;
        }
        if (state == 56)
        {
			with other 
			{
				if place_meeting(x,y + 1,obj_collisionparent)
				{
					scr_sound(sound_enemystomp);
					hp = 0;
					instance_create(x, y, obj_bumpeffect);
					vsp = -9;
					hsp = 10 * other.xscale;
					image_index = 0;
					stunned = 200;
					state = 89;
					other.machpunchAnim = 1;
					with other 
					{
						if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && state != 60)
						 vsp = -10;
					}
				}
			}
        }
        if (attacking == 1 && state != 56)
        {
            if (state == 76)
                other.shot = 1;
            image_index = 0;
            instance_destroy(other.id);
            machpunchAnim = 1;
            if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && state != 60)
                vsp = -10;
        }
    }
}
