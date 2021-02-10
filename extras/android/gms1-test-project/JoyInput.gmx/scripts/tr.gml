// function used to translate
// does not work yet, with some examples exceptions
var translated = argument0;
switch(argument0)
{
    case "_epilepsy_title":
        translated = 'Epilepsy warning';
        break
    case "_epilepsy":
        translated =  'A few people may experience epileptic seizures when exposed to certain light patterns or flashing lights, such as while watching TV or playing video games, even those with no history of prior seizures or epilepsy.#If you experience any of the following symptoms - altered vision, muscle or eye twitching, loss of awareness, disorientation, any involutary movement, or convulsions - IMMEDIATELY stop playing and consult your physician.';
        break
    case "_disclaimer_title":
        translated =  'Disclaimer';
        break
    case "_disclaimer":
        translated =  'This game is a non-profit fangame project and should not be sold. Overbound Game Studio and contributors are in no way affiliated with Sega or Sonic Team.#Sonic the Hedgehog is a trademark of SEGA®. The copyrights of “Sonic the Hedgehog” and all associated characters, names, terms, art, and music thereof belong to SEGA®. All registered trademarks and copyrights belong to SEGA® and Sonic Team®.';
        break
    case "_github":
        translated =  'Source code available at https://github.com/overbound/SonicTimeTwisted under GPL v3';
        break
    default:
        translated =  argument0;
        break
}
if(string_count('::', translated) >= 2
    && string_char_at(translated, 1) == ':'
    && string_char_at(translated, 2) == ':')
{
    translated = string_copy(translated, 3, string_length(translated) - 2);
    var macro_end_pos = string_pos('::', translated);
    translated = string_copy(translated, macro_end_pos + 2, string_length(translated) - macro_end_pos - 1);
}
return translated;
