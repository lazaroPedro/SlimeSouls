function sc_collision( x, y, hspd, vspd, spd, move_dir, tilemap_id){
vspd += 0.5

var fut_x = x + hspd;
if (!place_meeting(fut_x , y, tilemap_id)) {
	
    x = fut_x;
} else {
    var step_x = sign(hspd);
    while (!place_meeting(x + step_x , y, tilemap_id)) {
        x += step_x;
    }
    hspd = 0;
}

var fut_y = y + vspd;
if (!place_meeting( x, fut_y,   tilemap_id)) {
    y = fut_y; 
} else {

	
    var step_y = sign(vspd);
    while (!place_meeting( x, y + step_y,   tilemap_id)) {
        y += step_y;
    }
    vspd = 0;
}




return {x: x, y: y, hspd: hspd, vspd: vspd};

}