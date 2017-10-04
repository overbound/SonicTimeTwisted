// toward_wrap(from, to, increment, w)

from = argument0;
to = argument1;
increment = argument2;
w = argument3;

return wrap(toward(from, shorter(from, to, w), increment), w);
