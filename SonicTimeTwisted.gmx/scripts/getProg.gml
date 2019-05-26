var p, a, b;
p = 1 + argument1 * 2 + argument2 * 128;
a = ord(string_char_at(argument0, p)) - 65;
if (a == -1) return -1;
b = ord(string_char_at(argument0, p + 1)) - 65;
return (a * 16 + b) / 255;

