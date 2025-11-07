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
    FLOAT_ATTACK,

}

state = BOSS_STATE.IDLE


float_attack_setup = false;
hspd = 0
vspd = 0
spd = 8
move_dir = 1
grav = 0.5;
tilemap_id = layer_tilemap_get_id("ts_ground");

jump_attack_count = 0;  
jump_attack_total = 12;  

float_attack_count = 0;    
float_attack_total =  8;

last_attack_state = BOSS_STATE.FLOAT_ATTACK;


alarm[0] = room_speed * 2

death_timer = 0;



 