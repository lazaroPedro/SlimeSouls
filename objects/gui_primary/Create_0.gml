view_w = camera_get_view_width(view_camera[0])
view_h = camera_get_view_height(view_camera[0])
stamina_max = 50
life_max = 100
key_left  = keyboard_check(ord("A"));
key_up  = keyboard_check(ord("W"));
key_enter  = keyboard_check(ord("W"));
active  = 0

menu = [0, 1, 2]
bar_w = 300
bar_h = 50

color1 = make_color_rgb(255, 0, 64)
color2 = make_color_rgb(19, 19, 19)
color3 = make_color_rgb(64, 150, 64)