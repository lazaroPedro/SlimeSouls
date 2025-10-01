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
	hero.alarm[0] = 30

}
if(instance_place(x + hspd, y, obj_enemy)){
	move_dir = move_dir * (-1)
}

if(place_meeting( x + hspd, y, tilemap_id)){
	move_dir = move_dir * (-1)
}

var result = sc_collision( x, y, hspd, vspd, spd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;

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
if(place_meeting(x + hspd, y, tilemap_id)){
    move_dir = move_dir * -1;
}

//--------------------------------
// Pulo periódico
//--------------------------------
if(jump_timer <= 0 && vspd == 0){
	vspd = jump_force;
	jump_timer = irandom_range(jump_min, jump_max)
}

//--------------------------------
// Ataque corpo a corpo
//--------------------------------
var hero = instance_nearest(x, y, obj_hero);
if(hero != noone && variable_instance_exists(hero, "invulnerable")){
    var dist = point_distance(x, y, hero.x, hero.y);
    if(dist <= melee_range && attack_timer <= 0){
        if(!hero.invulnerable){
            hero.life -= melee_dmg;
            hero.invuln_timer = 30; 
            hero.invulnerable = true;
        }
        attack_timer = attack_cooldown;
    }
}

//--------------------------------
// Ataque em área
//--------------------------------

if (area_timer <= 0 && hero != noone){
	var dist = point_distance(x,y,hero.x,hero.y);
	if( dist <= area_range){
		if(!hero.invulnerable){
			hero.life -= area_dmg;
			hero.invuln_timer = 30;
			hero.invulnerable = true;
		}
		area_timer = area_cooldown;
	}
}


//--------------------------------
// Fuga estratégica
//--------------------------------
if (!is_fleeing && life <= max_life * flee_threshold){
	is_fleeing = true;
	spd = spd * flee_speed_mult;
	move_dir = (hero.x < x) ? 1: -1;
}

//--------------------------------
// Morte
//--------------------------------
if (life <= 0){
	instance_destroy();
}

//--------------------------------
// Movimento e colisão
//--------------------------------

vspd += 0.5;
var result = sc_collision(x,y,hspd,vspd,spd,move_dir,tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;