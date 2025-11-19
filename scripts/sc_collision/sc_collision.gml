function sc_collision( x, y, hspd, vspd, move_dir, tilemap_id){
	
	
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