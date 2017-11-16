/// for the "random digits" score tally mode, display score values using random digits
// basically, we're going to return a random number which only has the same number of
// digits as the original number

var digitsNumber = string_length(string(abs(argument0)));
return floor(random_range(power(10, digitsNumber - 1), power(10, digitsNumber)));
