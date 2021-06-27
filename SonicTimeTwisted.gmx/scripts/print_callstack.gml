///print_callstack()

var _callstack = debug_get_callstack();
var _len = array_length_1d(_callstack);

show_debug_message("-- callstack begin --");
for (var _i = 0; _i < _len; _i++) {
    show_debug_message(_callstack[_i]);
}
show_debug_message("-- callstack end --");
