// --- MOVIMENTO ---

sc_player_input()





switch (state) {
	case StatePlayer.IDLE: sc_player_idle(); break;
	case StatePlayer.ATTACK: sc_player_attack(); break;
	case StatePlayer.ROLL: sc_player_roll(); break;
	case StatePlayer.DAMAGE: sc_player_damage(); break;
}


if(global.life <= 0){
game_restart()
}

if(global.stamina <=50 ){
global.stamina +=  0.2
}

if(vspd > 10) {
if(place_meeting( x, y, tilemap_id)){
global.life -= 10 
}
}
if (instance_place(x + hspd, y + vspd, obj_goto)){
	
	room_goto(room_boss)
}
var result = sc_collision( x, y, hspd, vspd, spd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;

if (instance_place(x + hspd, y + vspd, dead)){
	
	game_restart()
}

