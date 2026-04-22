switch(tipo) {
    case 1: draw_set_color(c_blue); break;
    case 2: draw_set_color(c_lime); break;
    case 3: draw_set_color(c_green);break;
    case 4: draw_set_color(c_yellow);break;
    case 5: draw_set_color(c_orange);break;
    case 6: draw_set_color(c_purple);break;
    case 7: draw_set_color(c_red); break;
    default: draw_set_color(c_gray);
}

draw_roundrect(x-32,y-16,x+32,y+16,false);
draw_set_color(c_white);
draw_roundrect(x-32,y-16,x+32,y+16,true);

draw_set_halign(fa_center); draw_set_color(c_black);
switch(tipo) {
    case 1: draw_text(x,y,"↓"); break;
    case 2: draw_text(x,y,"→"); break;
    case 3: draw_text(x,y,"←"); break;
    case 4: draw_text(x,y,"IF"); break;
    case 5: draw_text(x,y,"ELSE"); break;
    case 6: draw_text(x,y,"REPEAT"); break;
    case 7: draw_text(x,y,"NOT"); break;
}
draw_set_halign(fa_left);