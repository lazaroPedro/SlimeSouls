view_w = camera_get_view_width(view_camera[0])
view_h = camera_get_view_height(view_camera[0])
death_hold = 0; 
death_mode = 0; 


life_max = 500
life = life_max

lifebar_w = 800
lifebar_h = 30

color1 = make_color_rgb(255, 150, 50)
color2 = make_color_rgb(19, 19, 19)

start_x = x;
start_y = y;


enum BOSS_STATE {
    IDLE,        
    JUMP_ATTACK, 
    TIRED,
	RETURN,
    FLOAT_ATTACK,
	DEATH
}

state = BOSS_STATE.IDLE


float_attack_setup = false;
hspd = 0
vspd = 0
spd = 0
move_dir = 1
grav = 0;
tilemap_id = layer_tilemap_get_id("ts_ground");

jump_attack_count = 0;  
jump_attack_total = 16;  

float_attack_count = 0;    
float_attack_total = 16;

last_attack_state = BOSS_STATE.FLOAT_ATTACK;


alarm[0] = room_speed * 2

death_timer = 0;

// kabum time
 explode_timer = 0;
 exploded = false;
 
if (state == BOSS_STATE.DEATH) {
    var spr_old = spr_boss2;             
    var spr_new = spr_boss_final;       

    var ox_old = sprite_get_xoffset(spr_old); 
    var oy_old = sprite_get_yoffset(spr_old); 

    var ox_new = sprite_get_xoffset(spr_new);
    var oy_new = sprite_get_yoffset(spr_new); 

    var draw_x = x + (ox_old - ox_new);
    var draw_y = y + (oy_old - oy_new);

    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(
        spr_new,
        clamp(image_index, 0, sprite_get_number(spr_new) - 1),
        draw_x, draw_y,
        max(0.001, image_xscale), max(0.001, image_yscale),
        image_angle, c_white, 1
    );
} else {
    draw_self();
}

 