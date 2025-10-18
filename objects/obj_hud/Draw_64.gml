var amount   = (clamp(global.life, 0, life_max) / life_max) * lifebar_w;
var amount_s = (clamp(global.stamina, 0, stamina_max) / stamina_max) * staminabar_w;

var x1  = 100;
var y1  = 100;
var x2  = x1 + amount;
var x2_t = x1 + lifebar_w;
var y2  = y1 + lifebar_h;

var x1_s = 100;
var y1_s = 100 + lifebar_h;
var x2_s = x1_s + amount_s;
var x2_st = x1_s + staminabar_w;
var y2_s = y1_s + staminabar_h;

// Fundo da barra
draw_set_color(color2);
draw_rectangle(x1, y1, x2_t, y2, false);

draw_set_color(color2);
draw_rectangle(x1_s, y1_s, x2_st, y2_s, false);

// Vida
if(global.life > 0){
    draw_set_color(color1);
    draw_rectangle(x1, y1, x2, y2, false);
}

// Stamina
if(global.stamina > 0){
    draw_set_color(color3);
    draw_rectangle(x1_s, y1_s, x2_s, y2_s, false);
}
// Tela Final
if (global.end_sequence) {
    var vw = camera_get_view_width(view_camera[0]);
    var vh = camera_get_view_height(view_camera[0]);
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, vw, vh, false);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    if (end_stage >= 1) {
        draw_text(vw*0.5, vh*0.45,
            "parabens pelo genocidio, vc dizimou os unicos slimes restantes no mundo"); // dica: sem acento evita quadradinhos
    }

    if (end_stage >= 4) {
        var w = 360;
        var h = 160;
        var rx = vw * 0.5 - w * 0.5;
        var ry = vh * 0.6 - h * 0.5;

        draw_set_color(make_color_rgb(20,20,20));
        draw_rectangle(rx, ry, rx + w, ry + h, false);

        draw_set_color(c_white);
        draw_text(vw*0.5, ry + 30, "Fim");

        var bw = w/2 - 30;
        var bh = 40;
        var bx1 = rx + 20;
        var by1 = ry + 80;
        var bx2 = rx + w/2 + 10;
        var by2 = ry + 80;

        draw_set_color(make_color_rgb(45,45,45));
        draw_rectangle(bx1, by1, bx1 + bw, by1 + bh, false);
        draw_rectangle(bx2, by2, bx2 + bw, by2 + bh, false);

        draw_set_color(c_white); 
        draw_text(bx1 + bw/2, by1 + bh/2, "Resetar");
        draw_text(bx2 + bw/2, by2 + bh/2, "Sair");
    }
}
