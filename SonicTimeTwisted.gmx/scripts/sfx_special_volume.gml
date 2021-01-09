///sfx_special_volume(sndindex)

// Put all special volume values for sounds here.
// case sound asset : volume;
switch (argument0) {
    case sndMetalBolt:          return 0.50;
    case sndMetalLaunch:        return 0.52;
    case sndMetalWoosh:         return 0.50;
    case sndRobotnikDeath:      return 0.41;
    case sndTLPWarp:            return 0.47;
    case sndBossHit:            return 0.57;
    case sndRing:               return 0.70;
    case sndGalanikHit:         return 0.53;
    case sndMetalSpeak:         return 0.90;
    case sndCaterminatorExtend: return 0.19;
    case sndSaucerHover:        return 0.53;
    case sndPropeller:          return 0.21;
    case sndRexChomp:           return 0.80;
    case sndSmash: {
        if (object_index == objShieldEarth_Rock) {
                                return 0.75; // use different gain if we're inside that object.
        }
        else {
                                return 1.00;
        }
    }
    default:                    return 1.00; // Not a special sound.
}
