var amount   = (clamp(global.life, 0, life_max) / life_max) * lifebar_w;


var x1  = 100;
var y1  = 100;
var x2  = x1 + amount;
var x2_t = x1 + lifebar_w;
var y2  = y1 + lifebar_h;


// Fundo da barra
draw_set_color(color2);
draw_rectangle(x1, y1, x2_t, y2, false);



// Vida
if(global.life > 0){
    draw_set_color(color1);
    draw_rectangle(x1, y1, x2, y2, false);
}

