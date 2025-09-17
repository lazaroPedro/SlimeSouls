enum StateEnemy{
ATTACK,
IDLE,
DAMAGE
}

state = StateEnemy.IDLE

life = 20
hspd = 0
vspd = 0
spd = 3
move_dir = 1
st_move = 0
tilemap_id = layer_tilemap_get_id("ts_ground");