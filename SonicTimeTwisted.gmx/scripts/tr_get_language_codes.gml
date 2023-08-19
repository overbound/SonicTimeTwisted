var result = 0;
var _currentlang = ds_map_find_first(global.TR_map);
var _nextlang = ds_map_find_next(global.TR_map, _currentlang);
result[0] = _currentlang;
while (!is_undefined(_nextlang)) {
    _currentlang = _nextlang;
    _nextlang = ds_map_find_next(global.TR_map, _currentlang)
    result[array_length_1d(result)] = _currentlang;
}
return result;
