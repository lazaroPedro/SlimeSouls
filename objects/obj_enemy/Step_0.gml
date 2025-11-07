if(life <= 0){
instance_destroy()
}
var hero = instance_place(x, y, obj_hero)
if (hero && !hero.immunity) {
	hero.immunity = true
	hero.state = StatePlayer.DAMAGE
		hero.vspd = -10
		var mv = hero.move_dir
		if(mv == 0) mv = 1
	hero.hspd =  mv * -5
	hero.sprite_index = spr_hero_dmg
	hero.image_blend = c_white
	global.life -= 10 
	hero.alarm[0] = 15

}
if(steps <=0){
	move_dir = move_dir * (-1)
	steps =random_range(100, 200)
}
--steps




//--------------------------------
// Atualização de timers
//--------------------------------

if (jump_timer > 0) jump_timer--;
if (attack_timer > 0) attack_timer--;
if (area_timer > 0) area_timer--;
if (invuln_timer > 0){
	invuln_timer--;
	if (invuln_timer <= 0) invulnerable = false;
}

//--------------------------------
// Patrulha simples
//--------------------------------
hspd = move_dir * spd;
 vspd += 0.5

if(instance_place(x + hspd, y,obj_enemy)|| place_meeting(x + hspd, y, tilemap_id)){
	move_dir = move_dir * -1;
	hspd = 0
}

//--------------------------------
// Pulo periódico
//--------------------------------
if(jump_timer <= 0 && place_meeting( x, y + 1, tilemap_id)){
	vspd = jump_force;
	jump_timer = irandom_range(jump_min, jump_max)
}


//--------------------------------
// Movimento e colisão
//--------------------------------
var result = sc_collision( x, y, hspd, vspd, spd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;
