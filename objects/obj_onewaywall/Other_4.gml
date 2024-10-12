if (obj_player.bbox_bottom > y)
{
    instance_destroy(obj_onewaywall);
    obj_platform.created = 0;
}