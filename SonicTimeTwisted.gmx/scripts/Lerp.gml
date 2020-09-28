//Lerp(from, to, amount, minimum)
var from = argument0;
var to = argument1;
var amount = argument2;
var minimum = argument3;
var increment = (to - from) * amount;
    if (to > from)
    {
    if increment < minimum
        from += minimum;
        else from += increment;
        if from > to return to;
        else return from;
    }
    else
    {
        if increment > -minimum
            from -=minimum;
        else from +=increment;
        
        if from < to
            return to;
            else return from;
    }
