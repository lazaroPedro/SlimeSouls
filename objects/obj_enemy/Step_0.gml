
var hero = instance_place(x, y, obj_hero)
if (hero && !hero.immunity) {
	audio_play_sound(dmg_effect, 1, false)

	hero.immunity = true
		hero.vspd = -10

	hero.hspd =  hero.move_dir * -10
	hero.sprite_index = spr_hero_dmg

	global.life -= 10 
	hero.alarm[0] = 30

}
if(steps <=0){
	move_dir = move_dir * (-1)
	steps = irandom_range(100, 200)
}
--steps




if (jump_timer > 0) jump_timer--;


hspd = move_dir * spd;
 vspd += 0.5

if( place_meeting(x + hspd, y, tilemap_id)){
	move_dir = move_dir * -1;
}

if(jump_timer <= 0 && place_meeting( x, y + 1, tilemap_id)){
	vspd = jump_force;
	jump_timer = irandom_range(jump_min, jump_max)
}



var result = sc_collision( x, y, hspd, vspd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;
