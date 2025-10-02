function sc_collision( x, y, hspd, vspd, spd, move_dir, tilemap_id){
	
	

var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1;
var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index) + 1;


vspd += 0.5

var fut_x = x + hspd;
if (place_meeting(x + hspd, y, tilemap_id)) {
   
    while (!place_meeting(x + sign(hspd), y, tilemap_id)) {
        x += sign(hspd)
    }
    hspd = 0;
} else {
    x += hspd;
}



if (place_meeting( x, y + vspd,   tilemap_id)) {
	
    while (!place_meeting( x, y +sign(vspd),   tilemap_id)) {
        y += sign(vspd);
    }
    vspd = 0;
} else{
	y += vspd
}




return {x: x, y: y, hspd: hspd, vspd: vspd};

}