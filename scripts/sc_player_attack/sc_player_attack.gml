function sc_player_attack(){


if(image_index > 1) {
	if(!instance_exists(obj_attack)){
	var dir = image_xscale;
	    var offset_x = 15 * image_xscale;
    var _xx = x + offset_x;
    var _yy = y - sprite_height;
var atk = instance_create_layer(_xx, _yy, "Attack", obj_attack);
atk.image_xscale = dir;
atk.direction = 0;
atk.image_angle = 0;


}}



	

if(image_index >= image_number - 1){

state = StatePlayer.IDLE
}

}


