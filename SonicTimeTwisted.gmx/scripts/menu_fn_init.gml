menu_type = 0;
state = 0;
main_bg_color_top = make_colour_rgb(114, 103, 126);
main_bg_color_bottom = make_colour_rgb(76, 69, 84);
main_border_color = make_colour_rgb(43, 28, 59);
main_bg_alpha = 0.75;
timer = 0;

item_script = menu_part_title_items;
action_script = menu_part_title_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

next_item_script = -1;
next_cursor = 0;

up = false;
up_prev = false;
up_press = false;
down = false;
down_prev = false;
down_press = false;
left = false;
left_prev = false;
left_press = false;
right = false;
right_prev = false;
right_press = false;
ok = false;
ok_prev = false;
ok_press = false;
cancel = false;
cancel_prev = false;
cancel_press = false;

is_touchscreen = input_is_touchscreen();
is_30_fps = false;

draw_offset_x = 0;
draw_offset_y = 0;

margin = 8;
button_slot_height = 28;
button_height = 21;
button_page_count = 7;

font_big = false;
font_small = false;

items = false;
button_width = 0;

cursor = -1;
prev_cursor = -1;

// this variable has different uses:
// - action to execute after a flash, if a button is set to flash
// - new value of a slider
temporary_variable = -1;

confirmation_text = '';
confirmation_yes_label = '';
confirmation_no_label = '';
confirmation_yes_action = -1;
confirmation_no_action = -1;
confirmation_cursor = 0;
confirmation_prev_cursor = -1;

scroll = 0;
scroll_max = 0;
scroll_target = 0;
scrollable = false;

s = surface_create(512, 256);
scrollable_s = surface_create(512, 256);

// these variables are calculated in item scripts for default displays and shouldn't be directly used in action scripts
internal__draw_menu_rect_x1 = 0;
internal__draw_menu_rect_x2 = 0;
internal__draw_menu_rect_x_center = 0;
internal__draw_menu_rect_y1 = 0;
internal__draw_menu_rect_y2 = 0;
internal__draw_menu_rect_y_center = 0;
internal__draw_menu_buttons_offset_x = 0;
internal__draw_menu_buttons_offset_y = 0;
internal__button_count = 0;

internal__draw_confirmation_height = 0;
internal__draw_confirmation_width = 0;
internal__draw_confirmation_rect_x1 = 0;
internal__draw_confirmation_rect_x2 = 0;
internal__draw_confirmation_rect_y1 = 0;
internal__draw_confirmation_rect_y2 = 0;
internal__draw_confirmation_yes_button_x1 = 0;
internal__draw_confirmation_yes_button_x2 = 0;
internal__draw_confirmation_no_button_x1 = 0;
internal__draw_confirmation_no_button_x2 = 0;
internal__draw_confirmation_buttons_y = 0;
internal__draw_confirmation_rect_x_center = 0;

internal__scroll_height = 0;

internal__menu_slide_offset_x = 0;

// touchscreen variables
internal__touch_x = 0;
internal__touch_y = 0;
internal__touch_dx = 0;
internal__touch_dy = 0;
internal__touch_len = 0;
internal__touch_dir = 0;
internal__touch_dir_changed = false;

