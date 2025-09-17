if(place_meeting( x + hspd, y, tilemap_id)){
	move_dir = move_dir * (-1)
}


if (place_meeting( x, y + 1, tilemap_id)) {


	vspd -=10	
}

if(cooldown <=0){
	
if (instance_place(x + hspd, y + vspd, tilemap_id)){
	global.life -=10 

	cooldown = 60
}


}



cooldown--




var result = sc_collision( x, y, hspd, vspd, spd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;