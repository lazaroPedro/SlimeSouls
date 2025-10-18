if (global.end_sequence) {
    end_timer += 1;
    var t1 = room_speed * 0.4;
    var t2 = room_speed * 2.0;
    var t3 = room_speed * 3.5;
    var t4 = room_speed * 5.0;

    if (end_timer >= t1) end_stage = max(end_stage, 1);
    if (end_timer >= t2) end_stage = max(end_stage, 2);
    if (end_timer >= t3) end_stage = max(end_stage, 3);
    if (end_timer >= t4) end_stage = max(end_stage, 4);

    if (end_stage >= 4) {
        var vw = camera_get_view_width(view_camera[0]);
        var vh = camera_get_view_height(view_camera[0]);
        var w = 360;
        var h = 160;
        var rx = vw * 0.5 - w * 0.5;
        var ry = vh * 0.6 - h * 0.5;

        // Buttons
        var bx1 = rx + 20;
        var by1 = ry + 80;
        var bw  = w/2 - 30;
        var bh  = 40;

        var bx2 = rx + w/2 + 10;
        var by2 = ry + 80;

        if (mouse_check_button_pressed(mb_left)) {
            var mx = device_mouse_x_to_gui(0);
            var my = device_mouse_y_to_gui(0);

            if (mx >= bx1 && mx <= bx1 + bw && my >= by1 && my <= by1 + bh) {
                room_goto(Room1);
            }
            if (mx >= bx2 && mx <= bx2 + bw && my >= by2 && my <= by2 + bh) {
                game_end();
            }
        }
    }
}
