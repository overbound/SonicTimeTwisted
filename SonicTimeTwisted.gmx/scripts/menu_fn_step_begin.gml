up_press = false;
if (up) {
    if (up_prev) {
        internal__hold_up_timer--;
        if (internal__hold_up_timer < 0) {
            up_press = true;
            internal__hold_up_timer = 5;
        }
    } else {
        up_press = true;
        internal__hold_up_timer = 30;
    }
}

down_press = false;
if (down) {
    if (down_prev) {
        internal__hold_down_timer--;
        if (internal__hold_down_timer < 0) {
            down_press = true;
            internal__hold_down_timer = 5;
        }
    } else {
        down_press = true;
        internal__hold_down_timer = 30;
    }
}

left_press = false;
if (left) {
    if (left_prev) {
        internal__hold_left_timer--;
        if (internal__hold_left_timer < 0) {
            left_press = true;
            internal__hold_left_timer = 5;
        }
    } else {
        left_press = true;
        internal__hold_left_timer = 30;
    }
}

right_press = false;
if (right) {
    if (right_prev) {
        internal__hold_right_timer--;
        if (internal__hold_right_timer < 0) {
            right_press = true;
            internal__hold_right_timer = 5;
        }
    } else {
        right_press = true;
        internal__hold_right_timer = 30;
    }
}

ok_press = ok && !ok_prev;
cancel_press = cancel && !cancel_prev;
