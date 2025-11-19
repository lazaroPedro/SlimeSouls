
key_right = keyboard_check(ord("D"));
key_left  = keyboard_check(ord("A"));
key_jump  = keyboard_check(ord("W"));

vspd += 0.5
move_dir= key_right - key_left;
hspd = move_dir * spd;
	
if(move_dir == 0){
	sprite_index=  spr_hero
} else{
	sprite_index=  spr_hero_mv
	image_xscale =  sign(hspd) + sign(hspd)
}

if (key_jump && place_meeting( x, y + 1, tilemap_id)) {
	vspd = jump_spd;

}

if(global.life <= 0){
game_restart()
}

if(immunity){
	sprite_index = spr_hero_dmg
}

var result = sc_collision( x, y, hspd, vspd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;



if (instance_place(x + hspd, y + vspd, dead)){
	
	game_restart()
}

if (instance_place(x + hspd, y + vspd, obj_goto)){
	
	room_goto(room_boss)
}

