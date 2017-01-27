#define lets_draw_inventory
var x1 = argument0+44;
var y1 = argument1+454;
var y2 = argument1+502;
var xm = 49;
var y1u = y1-23;
var y1d = y1+23;
var x1l = x1-23;
var x1r = x1+23;
var y2u = y2-23;
var y2d = y2+23;


for (i=1;i<16;i+=1){
    if global.inventory[i] != 0{
        draw_sprite(global.item_sprite[global.inventory[i]],0,x1+(xm*(i-1)),y1);
    }
}

for (i=16;i<31;i+=1){
    if global.inventory[i] != 0{
        draw_sprite(global.item_sprite[global.inventory[i]],0,x1+(xm*(i-16)),y2);
    }
}



for (i=1;i<16;i+=1){
if (mouse_x-view_xview[0]>x1l+(xm*(i-1)) && mouse_x-view_xview[0]<x1r+(xm*(i-1)) && mouse_y-view_yview[0]>y1u && mouse_y-view_yview[0]<y1d){
    if global.inventory[i] != 0 {item_caption(i,x1r+(xm*(i-1)),y1u);}
    if mouse_check_button_pressed(mb_right){ item_use(i); }
}
}

for (i=16;i<31;i+=1){
if (mouse_x-view_xview[0]>x1l+(xm*(i-16)) && mouse_x-view_xview[0]<x1r+(xm*(i-16)) && mouse_y-view_yview[0]>y2u && mouse_y-view_yview[0]<y2d){
    if global.inventory[i] != 0 {item_caption(i,x1r+(xm*(i-16)),y2u);}
    if mouse_check_button_pressed(mb_right){ item_use(i); }
}
}

#define item_caption
var item_slot_id = argument0;
var item_id = global.inventory[item_slot_id]

var xx = argument1;
var yy = argument2;

draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(xx-10,yy+10,xx+190,yy-90,c_black);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(f_char);
draw_text(xx-5,yy-75,global.item_name[item_id]);
draw_set_font(f_char_text);
draw_text(xx-5,yy-40,global.item_text[item_id]);
