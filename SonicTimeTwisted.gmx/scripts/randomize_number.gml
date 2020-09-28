/// for the "random digits" score tally mode, display score values using random digits
// basically, we're going to return a random number with a set number of digits
var digitsNumber = argument0;
if(digitsNumber <= 0)
{
    return 0;
}
return floor(random_range(power(10, digitsNumber - 1), power(10, digitsNumber)));
