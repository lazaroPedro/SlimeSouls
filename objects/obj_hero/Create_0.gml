enum StatePlayer{
ATTACK,
IDLE,
ROLL,
DAMAGE
}
spd = 5;
jump_spd = -12;
hspd = 0;
vspd = 0;
move_dir = 0;
tilemap_id = layer_tilemap_get_id("ts_ground");

life = 50


gvt = 0.5;
state = StatePlayer.IDLE
cooldown = true;
roll_time = 40

immunity = false;

key_right =  0;
key_left =  0;
key_jump =  0;
key_roll = 0;
key_attack =  0;
