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
