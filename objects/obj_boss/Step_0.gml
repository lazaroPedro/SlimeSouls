if (state != BOSS_STATE.DEATH && life <= 0) {
    state = BOSS_STATE.DEATH;

    hspd = 0; vspd = 0; grav = 0;
    sprite_index  = spr_boss_final;
    image_index   = 0;
    image_speed   = 3;      
    image_xscale  = 1;
    image_yscale  = 1;
    image_angle   = 0;
    image_alpha   = 1;
    visible       = true;

    global.cutscene = true;
    explode_timer   = room_speed * 0.15;
}


switch (state) {
	
case BOSS_STATE.DEATH:
    if (explode_timer > 0) {
        explode_timer--;
    } else {
        image_speed = max(image_speed, 3);

        var frames = sprite_get_number(spr_boss_final);
        if (frames <= 1) {       
            if (!variable_instance_exists(id, "death_hold")) death_hold = room_speed * 0.5;
            death_hold--;
            if (death_hold <= 0) {
                global.end_sequence = true;
                instance_destroy();
            }
        } else {
            if (image_index >= frames - 1) {
                global.end_sequence = true;
                instance_destroy();
            }
        }
    }
break;


    case BOSS_STATE.IDLE:
        hspd = 0;
        break;

    case BOSS_STATE.JUMP_ATTACK:
		sprite_index = spr_boss2
		grav = 1.5;
		spd = 15
        if (tilemap_get_at_pixel(tilemap_id, x, y + 1)) {
            hspd = spd * move_dir;
            vspd = -10;
            jump_attack_count++;

            if (jump_attack_count % 8 == 0) {
                move_dir *= -1;
            }

            if (jump_attack_count >= jump_attack_total) {
                state = BOSS_STATE.RETURN;
                alarm[2] = room_speed * 3; 
            }
        }
        break;

    case BOSS_STATE.TIRED:
		sprite_index = spr_boss_tired
        hspd = 0;
        break;
case BOSS_STATE.FLOAT_ATTACK:

		sprite_index = spr_boss2
		grav = 0.5;
		spd = 3
        if (tilemap_get_at_pixel(tilemap_id, x, y + 1)) {
		hspd = 0;
        vspd = -15; 
		hspd = spd * move_dir;
		
        float_attack_count++;
    if (float_attack_count % 8 == 0) {
                move_dir *= -1;
            }
            if (float_attack_count >= float_attack_total) {
                state = BOSS_STATE.RETURN;
                alarm[1] = room_speed * 3; 
            }
        }

        break;
		
	case BOSS_STATE.RETURN:
        var _dir = sign(start_x - x);
        hspd = _dir * spd;
        if (abs(x - start_x) < spd) {
            x = start_x;
            hspd = 0;
            state = BOSS_STATE.TIRED;

            if (last_attack_state == BOSS_STATE.FLOAT_ATTACK) {
                alarm[1] = room_speed * 3; 
            } else {
                alarm[2] = room_speed * 3; 
            }
        }
        break;	
}

if (state != BOSS_STATE.DEATH && life > 0) {
    var hero = instance_place(x, y, obj_hero);
    if (hero && !hero.immunity) {
        hero.immunity = true;
        hero.state = StatePlayer.DAMAGE;
        hero.vspd = -10;
        var mv = hero.move_dir;
        if (mv == 0) mv = 1;
        hero.hspd = mv * -5;
        hero.sprite_index = spr_hero_dmg;
        hero.image_blend = c_white;
        global.life -= 0;
        hero.alarm[0] = 30;
    }
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
	global.life -= 20 
	hero.alarm[0] = 30

}


// gravidade
if (!tilemap_get_at_pixel(tilemap_id, x, y + 1)) {
    vspd += grav;
}

// parede
if (tilemap_get_at_pixel(tilemap_id, x + (spd * move_dir), y)) {
    move_dir *= -1;
}

// Horizontal
var _hspd_final = hspd;
if (tilemap_get_at_pixel(tilemap_id, x + _hspd_final, y)) {
    while(!tilemap_get_at_pixel(tilemap_id, x + sign(_hspd_final), y)) {
        x += sign(_hspd_final);
    }
    _hspd_final = 0;
}
x += _hspd_final;

// Vertical
var _vspd_final = vspd;
if (tilemap_get_at_pixel(tilemap_id, x, y + _vspd_final)) {
    while(!tilemap_get_at_pixel(tilemap_id, x, y + sign(_vspd_final))) {
        y += sign(_vspd_final);
    }
    _vspd_final = 0;
}
y += _vspd_final;