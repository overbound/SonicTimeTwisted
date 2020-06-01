// function used to translate
// does not work yet, with some examples exceptions
switch(argument0)
{
    case "_epilepsy_warning":
        return 'Epilepsy warning';
    case "_epilepsy":
        return 'A few people may experience epileptic seizures when exposed to certain light patterns or flashing lights, such as while watching TV or playing video games, even those with no history of prior seizures or epilepsy.#If you experience any of the following symptoms - altered vision, muscle or eye twitching, loss of awareness, disorientation, any involutary movement, or convulsions - IMMEDIATELY stop playing and consult your physician.';
    case "_copyright":
        return 'This game is a non-profit fangame project and should not be sold. Overbound Game Studio and contributors are in no way affiliated with Sega or Sonic Team.#Sonic the Hedgehog is a trademark of SEGA®. The copyrights of “Sonic the Hedgehog” and all associated characters, names, terms, art, and music thereof belong to SEGA®. All registered trademarks and copyrights belong to SEGA® and Sonic Team®.';
    case "_github":
        return 'Source code available at https://github.com/overbound/SonicTimeTwisted under GPL v3';
    default:
        return argument0;
}
