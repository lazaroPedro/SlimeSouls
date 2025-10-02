view_w = camera_get_view_width(view_camera[0])
view_h = camera_get_view_height(view_camera[0])

life_max = 500
life = life_max

lifebar_w = 800
lifebar_h = 30

color1 = make_color_rgb(255, 150, 50)
color2 = make_color_rgb(19, 19, 19)



enum StateBoss{
ATTACK,
IDLE,
DAMAGE
}

state = StateBoss.IDLE


hspd = 0
vspd = 0
spd = 4
move_dir = 1
st_move = 30
tilemap_id = layer_tilemap_get_id("ts_ground");
cooldown = 60