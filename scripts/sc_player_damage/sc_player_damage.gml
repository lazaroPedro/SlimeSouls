function sc_player_damage(){
	
	if(immunity){
	sprite_index = spr_hero_dmg
	image_blend = c_white
	
	
	} else {
	state = StatePlayer.IDLE
	}
}