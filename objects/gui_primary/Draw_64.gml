var x1  = (view_w - bar_w ) / 2;
var y1  = (view_h - bar_h) / 2;
var x2  = x1 + 100;
var x2_t = x1 + bar_w;
var y2  = y1 + bar_h;

// Fundo da barra

draw_set_color(c_red);
draw_set_font(font_boss)
draw_text(x1 + 1, y1+1, "Iniciar");
draw_set_color(c_red);
draw_rectangle(x1, y1, x2_t, y2, true);


// Vida
if(life > 0){
    draw_set_color(color1);
    draw_rectangle(x1, y1, x2, y2, false);
}