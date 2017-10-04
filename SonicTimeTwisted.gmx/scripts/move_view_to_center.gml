//move_view_to_center(offset)
return x>=view_xview+argument0 and y>=view_yview+argument0 and
x<view_xview+view_wview-argument0 and
y<view_yview+view_hview-argument0;
 /*   if view_xview + view_wview*.5 > view_xview -offset
        view_xview-=2;
    if view_xview + view_wview*.5 < view_xview +offset
        view_xview+=2;
    if view_yview + view_hview*.5 > view_yview -offset
        view_yview-=2;
    if view_yview + view_hview*.5 < view_yview +offset
        view_yview+=2;*/
        
        
