///set_boss_music(roomIndex)
var roomIndex = argument0;
with (objMusic) {
    switch (roomIndex) {
        // Regular boss theme.
        case TT2_f:
        case TT2_p:
        case FF2_f:
        case FF2_p:
        case VV2_f:
        case VV2_p:
        case RR2_f:
        case RR2_p: {
            bossLoopAsset = bgmBossLoop;
            bossIntroAsset = bgmBossIntro;
            return true;
        }
        
        // Metal Sonic theme.
        case DD2_f:
        case DD2_p:
        case VV1_f:
        case VV1_p: {
            bossLoopAsset = bgmMetalSonicLoop;
            bossIntroAsset = bgmMetalSonicIntro;
            return true;
        }
        
        // Galanik Panic theme. (Galanik 2 theme is the level music, so it's not here)
        case PP2: {
            bossLoopAsset = bgmGalanik1Loop;
            bossIntroAsset = bgmGalanik1Intro;
            return true;
        }
        
        // This room has two bosses, Metal Sonic at the start, and Walker at the end.
        case AA2_f:
        case AA2_p: {
            if (other.object_index == objEggWalkerBossController) {
                bossLoopAsset = bgmBossLoop;
                bossIntroAsset = bgmBossIntro;
                show_debug_message("walker boss mus.");
            }
            else {
                bossLoopAsset = bgmMetalSonicLoop;
                bossIntroAsset = bgmMetalSonicIntro;
                show_debug_message("metal sonic mus.");
            }
            return true;
        }
        
        // Error Handler...... theme???
        default: {
            var errmsg = tr_format("Tried to set boss music for an unknown room. (ind=%0,name=%1)", roomIndex, room_get_name(roomIndex));
            show_error(errmsg, false);
            return false;
        }
    }
}
