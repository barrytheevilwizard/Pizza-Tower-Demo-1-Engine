
x = Approach(x,obj_player.x,distance_to_object(obj_player) / 25)
y = Approach(y,obj_player.y,distance_to_object(obj_player) / 25)
if (abs((x - obj_player.x)) > 30)
    image_xscale = sign((obj_player.x - x))
image_angle += distance_to_object(obj_player) / 15