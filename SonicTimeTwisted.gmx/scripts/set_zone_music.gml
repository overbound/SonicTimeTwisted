///set_zone_music(roomIndex)
var roomIndex = argument0;
with (objMusic) {
    switch (roomIndex) {
        // Attraction Attack
        case AA1_f: // Future
        case AA2_f: {
            musicLoopAsset = bgmAAFutureLoop;
            musicIntroAsset = bgmAAFutureIntro;
            return true;
        }
        
        case AA1_p: // Past
        case AA2_p: {
            musicLoopAsset = bgmAAPastLoop;
            musicIntroAsset = bgmAAPastIntro;
            return true;
        }
        
        // RR
        case RR1_f: // Future
        case RR2_f: {
            musicLoopAsset = bgmRRFutureLoop;
            musicIntroAsset = bgmRRFutureIntro;
            return true;
        }
        
        case RR1_p: // Past
        case RR2_p: {
            musicLoopAsset = bgmRRPastLoop;
            musicIntroAsset = bgmRRPastIntro;
            return true;
        }
        
        // FF
        case FF1_f: // Future
        case FF2_f: {
            musicLoopAsset = bgmFFFutureLoop;
            musicIntroAsset = musicLoopAsset; // ????
            return true;
        }
        
        case FF1_p: // Past
        case FF2_p: {
            musicLoopAsset = bgmFFPastLoop;
            musicIntroAsset = bgmFFPastIntro;
            return true;
        }
        
        // VV
        case VV1_f: // Future
        case VV2_f: {
            musicLoopAsset = bgmVVFutureLoop;
            musicIntroAsset = bgmVVFutureIntro;
            return true;
        }
        
        case VV1_p: // Past
        case VV2_p: {
            musicLoopAsset = bgmVVPastLoop;
            musicIntroAsset = bgmVVPastIntro;
            return true;
        }
        
        // DD
        case DD1_f: // Future
        case DD2_f: {
            musicLoopAsset = bgmDDFutureLoop;
            musicIntroAsset = bgmDDFutureIntro;
            return true;
        }
        
        case DD1_p: // Past
        case DD2_p: {
            musicLoopAsset = bgmDDPastLoop;
            musicIntroAsset = bgmDDPastIntro;
            return true;
        }
        
        // TT
        case TT1_f: // Future
        case TT2_f: {
            musicLoopAsset = bgmTTFutureLoop;
            musicIntroAsset = bgmTTFutureIntro;
            return true;
        }
        
        case TT1_p: // Past
        case TT2_p: {
            musicLoopAsset = bgmTTPastLoop;
            musicIntroAsset = bgmTTPastIntro;
            return true;
        }
        
        // Sunken Saucer
        case SS1: {
            if (objProgram.spawn_tag == 25) {
                musicLoopAsset = bgmSS2Loop;
                musicIntroAsset = bgmSS2Intro;
            }
            else {
                musicLoopAsset = bgmSS1Loop;
                musicIntroAsset = bgmSS1Intro;
            }
            return true;
        }
        
        // Planetary Panic
        case PP1: {
            musicLoopAsset = bgmPP1Loop;
            musicIntroAsset = bgmPP1Intro;
            return true;
        }
        
        case PP2: {
            musicLoopAsset = bgmPP2Loop;
            musicIntroAsset = bgmPP2Intro;
            return true;
        }
        
        // MM
        case MM1: {
            musicLoopAsset = bgmGalanik2Loop;
            musicIntroAsset = bgmGalanik2Intro;
            return true;
        }
        
        // Special Stage Result?
        case ss_results_screen:
        case saveSelect: {
            musicLoopAsset = bgmSaveScreenLoop;
            musicIntroAsset = bgmSaveScreenIntro;
            return true;
        }
        
        // Special Stages
        case SSF1: // Future
        case SSF2:
        case SSF3:
        case SSF4:
        case SSF5:
        case SSF6:
        case SSF7: {
            musicLoopAsset = bgmSpecialFutureLoop;
            musicIntroAsset = bgmSpecialFutureIntro;
            return true;
        }
        
        case SSP1: // Past
        case SSP2:
        case SSP3:
        case SSP4:
        case SSP5:
        case SSP6:
        case SSP7: {
            musicLoopAsset = bgmSpecialPastLoop;
            musicIntroAsset = bgmSpecialPastIntro;
            return true;
        }
        
        // Error Handler
        default: {
            var errmsg = tr_format("Tried to set zone music for an unknown room. (ind=%0,name=%1)", roomIndex, room_get_name(roomIndex));
            show_error(errmsg, false);
            return false;
        }
    }
}
