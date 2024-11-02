image_xscale = obj_player.xscale;
if obj_player.state != 76 && obj_player.state != 82
    instance_destroy();
if global.character == "P"
x = obj_player.x + obj_player.movespeed * obj_player.xscale;
else if global.character == "M"
x = obj_player.x + (obj_player.movespeed * obj_player.xscale) + 20 * obj_player.xscale ;
y = obj_player.y;