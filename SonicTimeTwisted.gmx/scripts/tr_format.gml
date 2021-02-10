///tr_format(fmt,...)
// 'cats "%0" %1' -> 'cats "are" cute'

if (argument_count < 1) return "";
var _str = argument[0];
// we loop backwards because '%10' may be replaced with '{value for %1 here}0'
for (var _i = argument_count - 1; _i > 0; _i--) {
    _str = string_replace(_str, "%" + string(_i - 1), argument[_i]);
}

return _str;
