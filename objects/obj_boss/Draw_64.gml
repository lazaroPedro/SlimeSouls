var amount   = (clamp(life, 0, life_max) / life_max) * lifebar_w;

var x1  = (view_w - lifebar_w ) / 2;
var y1  = view_h - 100;
var x2  = x1 + amount;
var x2_t = x1 + lifebar_w;
var y2  = y1 + lifebar_h;

// Fundo da barra

draw_set_color(c_black);
draw_set_font(font_boss)
draw_text(x1 + 30, y1-30, "Rei dos Slimes ");
draw_set_color(color2);
draw_rectangle(x1, y1, x2_t, y2, false);


// Vida
if(life > 0){
    draw_set_color(color1);
    draw_rectangle(x1, y1, x2, y2, false);
}
