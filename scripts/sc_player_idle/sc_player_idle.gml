function sc_player_idle(){
	move_dir= key_right - key_left;
	hspd = move_dir * spd;
	
	if(move_dir == 0){
	sprite_index=  spr_hero

	} else{
		
	sprite_index=  spr_hero_mv
	image_xscale = sign(hspd)

	}


	
if (key_jump && place_meeting( x, y + 1, tilemap_id) && global.stamina >= 10) {
    global.stamina -=15;
	vspd = jump_spd;

	
}






   



if (key_attack &&  state != StatePlayer.ATTACK && global.stamina >15) {
	
	state = StatePlayer.ATTACK;
    sprite_index = spr_hero_attack;
    image_index = 0;
	global.stamina -= 15

	}
	
if (key_roll &&  state != StatePlayer.ROLL && global.stamina >15 && place_meeting( x, y + 1, tilemap_id)) {
	
	state = StatePlayer.ROLL;
    sprite_index = spr_roll_hero;
    image_index = 0;
	global.stamina -= 15

}}
