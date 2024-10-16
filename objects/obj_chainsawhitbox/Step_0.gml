image_xscale = obj_player.xscale;
x = obj_player.x + obj_player.hsp;
y = obj_player.y + obj_player.vsp;
bumpeffect = 0;
if (obj_player.state != 19) && (obj_player.state != 1)
    instance_destroy();
if (obj_player.state == 19)
sprite_index = spr_chainsawswinghitbox
else 
sprite_index = spr_chainsawhitbox
with instance_place(x,y,obj_baddie)
instance_destroy()
with instance_place(x + obj_player.hsp,y,obj_destructibles)
instance_destroy()