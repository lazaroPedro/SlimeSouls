enum StateEnemy{
ATTACK,
IDLE,
DAMAGE
}

state = StateEnemy.IDLE

life = 20
hspd = 0
vspd = 0
spd = 1.5
move_dir = 1
st_move = 0
tilemap_id = layer_tilemap_get_id("ts_ground");
<<<<<<< HEAD

=======
>>>>>>> 532cb0c3ae7a0c0634726af4e924fbac0e45d656
jump_min = 60;
jump_max = 120;
jump_timer = irandom_range(jump_min, jump_max);

jump_force = -8;
jump_timer = irandom_range(jump_min, jump_max);

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

<<<<<<< HEAD
=======
multiply_on_death = true;
spawn_count = 2;
spawn_obj = obj_enemy
>>>>>>> 532cb0c3ae7a0c0634726af4e924fbac0e45d656

