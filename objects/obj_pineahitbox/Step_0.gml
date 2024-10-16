
if instance_exists(ID)
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
}
else
instance_destroy();
with (ID) {
    if ((state != 79) && (state != 85)) || obj_player.state == 76 {
        hitboxcreate = 0;
        instance_destroy(other.id);
    }
}