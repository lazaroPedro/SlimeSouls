enum StateEnemy{
ATTACK,
IDLE,
DAMAGE
}

state = StateEnemy.IDLE

life = 10
hspd = 0
vspd = 0
spd = 3
st_move = 0
tilemap_id = layer_tilemap_get_id("ts_ground");
jump_min = 60;
jump_max = 120;
jump_timer = irandom_range(jump_min, jump_max);

steps= random_range(100, 200)
move_dir = choose(1, -1)
jump_force = -8;

attack_timer = 0;
attack_cooldown = 60;
melee_range = 20;
melee_dmg = 5;

area_timer = 0;
area_cooldown = 180;
area_range = 60;
area_dmg = 8;

invulnerable = false;
invuln_timer = 0;

max_life = 20;
flee_threshold = 0.25;
is_fleeing = false;
flee_speed_mult = 1.3;

multiply_on_death = true;
spawn_count = 2;
spawn_obj = obj_enemy

