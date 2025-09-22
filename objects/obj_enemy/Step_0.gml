


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