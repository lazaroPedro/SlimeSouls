
var gravity_default = 2;
var gravity_float   = 0.5;


vspd += grav;


hspd = move_dir * spd;



switch (state) {
    
    case BOSS_STATE.IDLE:
        move_dir = 0;
        sprite_index = spr_boss;
        grav = gravity_default;
        break;
        

    case BOSS_STATE.JUMP_ATTACK:
        sprite_index = spr_boss;
        grav = gravity_default;
        

        if (tilemap_get_at_pixel(tilemap_id, x, y + 1)) {
            vspd = random_range(-30, -25);
            jump_attack_count++;
            
            if (jump_attack_count >= jump_attack_total) {
                state = BOSS_STATE.TIRED;
                alarm[2] = room_speed * 3;
                jump_attack_count = 0;
            }
        }
        break;


    case BOSS_STATE.FLOAT_ATTACK:
        sprite_index = spr_boss;
        grav = gravity_float;
        
        if (tilemap_get_at_pixel(tilemap_id, x, y + 1)) {
            vspd = random_range(-15, -12);
            float_attack_count++;
            
            if (float_attack_count >= float_attack_total) {
                state = BOSS_STATE.TIRED;
                alarm[1] = room_speed * 3;
                float_attack_count = 0;
            }
        }
        break;


    case BOSS_STATE.TIRED:
        sprite_index = spr_boss_tired;
        grav = 0.5;
        hspd = 0;
        break;
}



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
    hero.alarm[0] = 30;

    global.life -= 20;
}



if (place_meeting(x + hspd, y, tilemap_id)) {
    move_dir *= -1;
    hspd = 0;
    vspd = 0;
}



var result = sc_collision(x, y, hspd, vspd, spd, move_dir, tilemap_id);
x = result.x;
y = result.y;
hspd = result.hspd;
vspd = result.vspd;
